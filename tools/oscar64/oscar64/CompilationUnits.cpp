#include "CompilationUnits.h"
#ifdef _WIN32
#include <io.h>
#else
#include <unistd.h>
#endif
#include <stdio.h>
#include <string.h>

CompilationUnits::CompilationUnits(Errors* errors)
	: mErrors(errors), mReferenced(nullptr), mUniqueID(0)
{
	mCompilationUnits = nullptr; 
	mPendingUnits = nullptr;
	mScope = new DeclarationScope(nullptr, SLEVEL_GLOBAL);
	mRuntimeScope = new DeclarationScope(nullptr, SLEVEL_GLOBAL);
	mVTableScope = new DeclarationScope(nullptr, SLEVEL_GLOBAL);
	mTemplateScope = new DeclarationScope(nullptr, SLEVEL_GLOBAL);
	mStartup = nullptr;

	for (int i = 0; i < 256; i++)
		mByteCodes[i] = nullptr;
}

CompilationUnits::~CompilationUnits(void)
{

}

int CompilationUnits::UniqueID(void)
{
	return mUniqueID++;
}


void CompilationUnits::AddReferenced(Declaration* ref)
{
	mReferenced.Push(ref);
}

bool CompilationUnits::AddUnit(Location& location, const char* name, const char* from)
{
	char	filename[200];

	if (!from)
	{
		strcpy_s(filename, name);
	}
	else
	{
		strcpy_s(filename, from);
		ptrdiff_t i = strlen(filename);
		while (i > 0 && (filename[i - 1] != '/' && filename[i - 1] != '\\'))
			i--;
		while (name[0] == '.' && name[1] == '.' && name[2] == '/')
		{
			name += 3;
			while (i > 0 && (filename[i - 1] != '/' && filename[i - 1] != '\\'))
				i--;
		}
		filename[i] = 0;
		strcat_s(filename, name);
	}

	int	i = 0;
	while (filename[i])
	{
		if (filename[i] == '\\')
			filename[i] = '/';
		i++;
	}

	if (_access(filename, 0) != 0)
	{
		mErrors->Error(location, EERR_FILE_NOT_FOUND, "Could not open source file.", filename);
		return false;
	}

	CompilationUnit* cunit = mCompilationUnits, * punit = nullptr;
	while (cunit && strcmp(cunit->mFileName, filename) != 0)
	{
		punit = cunit;
		cunit = cunit->mNext;
	}
	
	if (cunit)
		return true;

	cunit = new CompilationUnit();
	cunit->mLocation = location;
	strcpy_s(cunit->mFileName, filename);
	cunit->mCompiled = false;
	cunit->mNext = nullptr;

	if (punit)
		punit->mNext = cunit;
	else
		mCompilationUnits = cunit;

	if (!mPendingUnits)
		mPendingUnits = cunit;

	return true;
}

CompilationUnit* CompilationUnits::PendingUnit(void)
{
	CompilationUnit* unit = mPendingUnits;

	if (mPendingUnits)
		mPendingUnits = mPendingUnits->mNext;

	return unit;
}
