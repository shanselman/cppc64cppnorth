#include <stdio.h>
#include <assert.h>

bool beq(int a, int b)
{
	return a == b;
}

bool blt(int a, int b)
{
	return a < b;
}

bool bgt(int a, int b)
{
	return a > b;
}

bool ble(int a, int b)
{
	return a <= b;
}

bool bge(int a, int b)
{
	return a >= b;
}

bool neq(int a, int b)
{
	return a == b;
}

#pragma native(neq)

bool nlt(int a, int b)
{
	return a < b;
}

#pragma native(nlt)

bool ngt(int a, int b)
{
	return a > b;
}

#pragma native(ngt)

bool nle(int a, int b)
{
	return a <= b;
}

#pragma native(nle)

bool nge(int a, int b)
{
	return a >= b;
}

#pragma native(nge)



bool beqz(int a)
{
	return a == 0;
}

bool bltz(int a)
{
	return a < 0;
}

bool bgtz(int a)
{
	return a > 0;
}

bool blez(int a)
{
	return a <= 0;
}

bool bgez(int a)
{
	return a >= 0;
}

bool neqz(int a)
{
	return a == 0;
}

#pragma native(neqz)

bool nltz(int a)
{
	return a < 0;
}

#pragma native(nltz)

bool ngtz(int a)
{
	return a > 0;
}

#pragma native(ngtz)

bool nlez(int a)
{
	return a <= 0;
}

#pragma native(nlez)

bool ngez(int a)
{
	return a >= 0;
}

#pragma native(ngez)




bool bequz(unsigned a)
{
	return a == 0;
}

bool bltuz(unsigned a)
{
	return a < 0;
}

bool bgtuz(unsigned a)
{
	return a > 0;
}

bool bleuz(unsigned a)
{
	return a <= 0;
}

bool bgeuz(unsigned a)
{
	return a >= 0;
}

bool nequz(unsigned a)
{
	return a == 0;
}

#pragma native(nequz)

bool nltuz(unsigned a)
{
	return a < 0;
}

#pragma native(nltuz)

bool ngtuz(unsigned a)
{
	return a > 0;
}

#pragma native(ngtuz)

bool nleuz(unsigned a)
{
	return a <= 0;
}

#pragma native(nleuz)

bool ngeuz(unsigned a)
{
	return a >= 0;
}

#pragma native(ngeuz)




bool beq1(int a)
{
	return a == 1;
}

bool blt1(int a)
{
	return a < 1;
}

bool bgt1(int a)
{
	return a > 1;
}

bool ble1(int a)
{
	return a <= 1;
}

bool bge1(int a)
{
	return a >= 1;
}

bool neq1(int a)
{
	return a == 1;
}

#pragma native(neq1)

bool nlt1(int a)
{
	return a < 1;
}

#pragma native(nlt1)

bool ngt1(int a)
{
	return a > 1;
}

#pragma native(ngt1)

bool nle1(int a)
{
	return a <= 1;
}

#pragma native(nle1)

bool nge1(int a)
{
	return a >= 1;
}

#pragma native(nge1)



void cmp(int a, int b)
{
	bool	beqf = beq(a, b), bltf = blt(a, b), bgtf = bgt(a, b), blef = ble(a, b), bgef = bge(a, b);
	bool	neqf = neq(a, b), nltf = nlt(a, b), ngtf = ngt(a, b), nlef = nle(a, b), ngef = nge(a, b);
	
	printf("BYTE   %d, %d : EQ %d LT %d GT %d\r", a, b, beqf, bltf, bgtf);
	printf("NATIVE %d, %d : EQ %d LT %d GT %d\r", a, b, neqf, nltf, ngtf);
	
	assert(beqf == neqf);
	assert(bltf == nltf);
	assert(bgtf == ngtf);	
	assert(blef == nlef);
	assert(bgef == ngef);	
}

void cmpz(int a)
{
	bool	beqf = beqz(a), bltf = bltz(a), bgtf = bgtz(a), blef = blez(a), bgef = bgez(a);
	bool	neqf = neqz(a), nltf = nltz(a), ngtf = ngtz(a), nlef = nlez(a), ngef = ngez(a);
	
	printf("BYTE   %d, 0 : EQ %d LT %d GT %d\r", a, beqf, bltf, bgtf);
	printf("NATIVE %d, 0 : EQ %d LT %d GT %d\r", a, neqf, nltf, ngtf);
	
	assert(beqf == neqf);
	assert(bltf == nltf);
	assert(bgtf == ngtf);	
	assert(blef == nlef);
	assert(bgef == ngef);	
}

void cmpuz(unsigned a)
{
	bool	beqf = bequz(a), bltf = bltuz(a), bgtf = bgtuz(a), blef = bleuz(a), bgef = bgeuz(a);
	bool	neqf = nequz(a), nltf = nltuz(a), ngtf = ngtuz(a), nlef = nleuz(a), ngef = ngeuz(a);
	
	printf("BYTE   %u, 0 : EQ %u LT %d GT %u\r", a, beqf, bltf, bgtf);
	printf("NATIVE %u, 0 : EQ %u LT %d GT %u\r", a, neqf, nltf, ngtf);
	
	assert(beqf == neqf);
	assert(bltf == nltf);
	assert(bgtf == ngtf);	
	assert(blef == nlef);
	assert(bgef == ngef);	
}

void cmp1(int a)
{
	bool	beqf = beq1(a), bltf = blt1(a), bgtf = bgt1(a), blef = ble1(a), bgef = bge1(a);
	bool	neqf = neq1(a), nltf = nlt1(a), ngtf = ngt1(a), nlef = nle1(a), ngef = nge1(a);
	
	printf("BYTE   %d, 1 : EQ %d LT %d GT %d LE %d GE %d\r", a, beqf, bltf, bgtf, blef, bgef);
	printf("NATIVE %d, 1 : EQ %d LT %d GT %d LE %d GE %d\r", a, neqf, nltf, ngtf, nlef, ngef);
	
	assert(beqf == neqf);
	assert(bltf == nltf);
	assert(bgtf == ngtf);	
	assert(blef == nlef);
	assert(bgef == ngef);	
}

int main(void)
{
	cmp( 0,  1);
	cmp( 0, -1);
	cmp( 1,  0);
	cmp(-1,  0);

	cmp(1, 1);
	cmp(1, 2);
	cmp(2, 1);

	cmp(-1, -1);
	cmp(-1, -2);
	cmp(-2, -1);
	
	cmp( 1, -1);
	cmp( 1, -2);
	cmp( 2, -1);

	cmp(-1,  1);
	cmp(-1,  2);
	cmp(-2,  1);


	cmp( 0,  10000);
	cmp( 0, -10000);
	cmp( 10000,  0);
	cmp(-10000,  0);

	cmp(10000, 10000);
	cmp(10000, 20000);
	cmp(20000, 10000);

	cmp(-10000, -10000);
	cmp(-10000, -20000);
	cmp(-20000, -10000);
	
	cmp( 10000, -10000);
	cmp( 10000, -20000);
	cmp( 20000, -10000);

	cmp(-10000,  10000);
	cmp(-10000,  20000);
	cmp(-20000,  10000);

	cmp(-30000,  30000);
	cmp(-30000, -30000);
	cmp( 30000,  30000);
	cmp( 30000, -30000);
	
	cmp( 0,  1024);
	cmp( 0, -1024);
	cmp( 1024,  0);
	cmp(-1024,  0);

	cmp(1024, 1024);
	cmp(1024, 1025);
	cmp(1025, 1024);

	cmp(-1024, -1024);
	cmp(-1024, -1025);
	cmp(-1025, -1024);
	
	cmp( 1024, -1024);
	cmp( 1024, -1025);
	cmp( 1025, -1024);

	cmp(-1024,  1024);
	cmp(-1024,  1025);
	cmp(-1025,  1024);

	cmpz(0);
	cmpz(1);
	cmpz(255);
	cmpz(256);
	cmpz(10000);
	cmpz(20000);
	cmpz(-1);
	cmpz(-255);
	cmpz(-256);
	cmpz(-10000);
	cmpz(-20000);

	cmpuz(0);
	cmpuz(1);
	cmpuz(255);
	cmpuz(256);
	cmpuz(10000);
	cmpuz(20000);
	cmpuz(40000);
	cmpuz(32767);
	cmpuz(32768);
	cmpuz(65535);

	cmp1(0);
	cmp1(1);
	cmp1(2);
	cmp1(3);
	cmp1(255);
	cmp1(256);
	cmp1(10000);
	cmp1(20000);
	cmp1(-1);
	cmp1(-2);
	cmp1(-3);
	cmp1(-255);
	cmp1(-256);
	cmp1(-10000);
	cmp1(-20000);

	return 0;
	
}
