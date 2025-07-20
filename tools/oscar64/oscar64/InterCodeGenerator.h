#pragma once

#include "Parser.h"
#include "InterCode.h"
#include "Linker.h"
#include "CompilerTypes.h"

class InterCodeGenerator
{
public:
	InterCodeGenerator(Errors * errors, Linker * linker);
	~InterCodeGenerator(void);

	struct DestructStack
	{
		Expression	* mDestruct;
		DestructStack* mNext;
	};

	struct ExValue
	{
		Declaration* mType;
		int		mTemp, mReference;
		int		mBits, mShift;

		ExValue(Declaration* type = nullptr, int temp = -1, int reference = 0, int bits = 0, int shift = 0)
			: mType(type), mTemp(temp), mReference(reference), mBits(bits), mShift(shift)
		{}
	};

	struct BranchTarget
	{
		InterCodeBasicBlock* mBlock;
		DestructStack* mStack;

		BranchTarget(void)
			: mBlock(nullptr), mStack(nullptr)
		{}
		BranchTarget(InterCodeBasicBlock * block, DestructStack * stack)
		: mBlock(block), mStack(stack)
		{}

	};

	uint64		mCompilerOptions;

	InterCodeProcedure* TranslateProcedure(InterCodeModule* mod, Expression* exp, Declaration * dec);
	void TranslateAssembler(InterCodeModule* mod, Declaration* adec,GrowingArray<Declaration *>	* refvars);
	void InitGlobalVariable(InterCodeModule* mod, Declaration* dec);
	void InitLocalVariable(InterCodeProcedure* proc, Declaration* dec, int index);
	void InitParameter(InterCodeProcedure* proc, Declaration* dec, int index);

	void CompleteMainInit(void);
protected:

	Errors* mErrors;
	Linker* mLinker;
	
	struct InlineMapper
	{
		GrowingArray<int>		mParams;
		InterCodeBasicBlock	*	mReturn;
		int						mResult, mDepth, mVarIndex;
		bool					mConstExpr;
		ExValue				*	mResultExp;
		Location			*	mLocation;

		InlineMapper(void)
			: mParams(-1), mResult(-1), mDepth(0), mResultExp(nullptr)
		{}
	};

	struct SwitchNode
	{
		int						mLower, mUpper;
		InterCodeBasicBlock	*	mBlock;
	};

	typedef GrowingArray<SwitchNode>	SwitchNodeArray;

	struct GotoNode
	{
		GotoNode			*	mNext;
		InterCodeBasicBlock	*	mBlock;
		Expression			*	mExpr;
		DestructStack		*	mDestruct;
	};

	InterCodeProcedure* mMainInitProc;
	InterCodeBasicBlock* mMainInitBlock, *mMainStartupBlock;

	Location MapLocation(Expression * exp, InlineMapper* inlineMapper);

	void BuildSwitchTree(InterCodeProcedure* proc, Expression* exp, InterCodeBasicBlock* block, InlineMapper * inlineMapper, ExValue v, const SwitchNodeArray& nodes, int left, int right, int vleft, int vright, InterCodeBasicBlock* dblock);

	ExValue ToValue(InterCodeProcedure* proc, Expression* exp, InterCodeBasicBlock*& block, InlineMapper* inlineMapper, ExValue v);
	ExValue Dereference(InterCodeProcedure* proc, Expression* exp, InterCodeBasicBlock*& block, InlineMapper* inlineMapper, ExValue v, int level = 0, int limit = 0);
	ExValue CoerceType(InterCodeProcedure* proc, Expression* exp, InterCodeBasicBlock*& block, InlineMapper* inlineMapper, ExValue v, Declaration * type, bool checkTrunc = true);
	ExValue TranslateExpression(Declaration * procType, InterCodeProcedure * proc, InterCodeBasicBlock*& block, Expression* exp, DestructStack*& destack, GotoNode*& gotos, const BranchTarget & breakBlock, const BranchTarget& continueBlock, InlineMapper * inlineMapper, ExValue * lrexp = nullptr);
	void TranslateLogic(Declaration* procType, InterCodeProcedure* proc, InterCodeBasicBlock* block, InterCodeBasicBlock* tblock, InterCodeBasicBlock* fblock, Expression* exp, DestructStack*& destack, GotoNode*& gotos, InlineMapper* inlineMapper);
	ExValue TranslateInline(Declaration* procType, InterCodeProcedure* proc, InterCodeBasicBlock*& block, Expression* exp, const BranchTarget& breakBlock, const BranchTarget& continueBlock, InlineMapper* inlineMapper, bool inlineConstexpr, ExValue* lrexp);
	void CopyStruct      (InterCodeProcedure* proc, Expression* exp, InterCodeBasicBlock*& block, ExValue vl, ExValue vr, InlineMapper* inlineMapper, bool moving);
	void CopyStructSimple(InterCodeProcedure* proc, Expression* exp, InterCodeBasicBlock * block, InlineMapper* inlineMapper, ExValue vl, ExValue vr);
	void StoreValue(InterCodeProcedure* proc, Expression* exp, InterCodeBasicBlock*& block, InlineMapper* inlineMapper, ExValue vl, ExValue vr);

	void ConnectGotos(Declaration* procType, InterCodeProcedure* proc, GotoNode* gotos, InlineMapper* inlineMapper);
	void UnwindDestructStack(Declaration* procType, InterCodeProcedure* proc, InterCodeBasicBlock*& block, DestructStack* stack, DestructStack * bottom, InlineMapper* inlineMapper);
	void BuildInitializer(InterCodeModule* mod, uint8 * dp, int offset, Declaration* data, InterVariable * variable);
};
