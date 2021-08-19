
a.out:     file format elf64-x86-64


Disassembly of section .init:

00000000000010b0 <_init>:
    10b0:	48 83 ec 08          	sub    $0x8,%rsp
    10b4:	48 8b 05 2d 1f 20 00 	mov    0x201f2d(%rip),%rax        # 202fe8 <__gmon_start__>
    10bb:	48 85 c0             	test   %rax,%rax
    10be:	74 02                	je     10c2 <_init+0x12>
    10c0:	ff d0                	callq  *%rax
    10c2:	48 83 c4 08          	add    $0x8,%rsp
    10c6:	c3                   	retq   

Disassembly of section .plt:

00000000000010d0 <.plt>:
    10d0:	ff 35 f2 1d 20 00    	pushq  0x201df2(%rip)        # 202ec8 <_GLOBAL_OFFSET_TABLE_+0x8>
    10d6:	ff 25 f4 1d 20 00    	jmpq   *0x201df4(%rip)        # 202ed0 <_GLOBAL_OFFSET_TABLE_+0x10>
    10dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000010e0 <printf@plt>:
    10e0:	ff 25 f2 1d 20 00    	jmpq   *0x201df2(%rip)        # 202ed8 <printf@GLIBC_2.2.5>
    10e6:	68 00 00 00 00       	pushq  $0x0
    10eb:	e9 e0 ff ff ff       	jmpq   10d0 <.plt>

00000000000010f0 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EE@plt>:
    10f0:	ff 25 ea 1d 20 00    	jmpq   *0x201dea(%rip)        # 202ee0 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EE@GLIBCXX_3.4.21>
    10f6:	68 01 00 00 00       	pushq  $0x1
    10fb:	e9 d0 ff ff ff       	jmpq   10d0 <.plt>

0000000000001100 <_ZNKSt12__basic_fileIcE7is_openEv@plt>:
    1100:	ff 25 e2 1d 20 00    	jmpq   *0x201de2(%rip)        # 202ee8 <_ZNKSt12__basic_fileIcE7is_openEv@GLIBCXX_3.4>
    1106:	68 02 00 00 00       	pushq  $0x2
    110b:	e9 c0 ff ff ff       	jmpq   10d0 <.plt>

0000000000001110 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@plt>:
    1110:	ff 25 da 1d 20 00    	jmpq   *0x201dda(%rip)        # 202ef0 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@GLIBCXX_3.4>
    1116:	68 03 00 00 00       	pushq  $0x3
    111b:	e9 b0 ff ff ff       	jmpq   10d0 <.plt>

0000000000001120 <fork@plt>:
    1120:	ff 25 d2 1d 20 00    	jmpq   *0x201dd2(%rip)        # 202ef8 <fork@GLIBC_2.2.5>
    1126:	68 04 00 00 00       	pushq  $0x4
    112b:	e9 a0 ff ff ff       	jmpq   10d0 <.plt>

0000000000001130 <write@plt>:
    1130:	ff 25 ca 1d 20 00    	jmpq   *0x201dca(%rip)        # 202f00 <write@GLIBC_2.2.5>
    1136:	68 05 00 00 00       	pushq  $0x5
    113b:	e9 90 ff ff ff       	jmpq   10d0 <.plt>

0000000000001140 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@plt>:
    1140:	ff 25 c2 1d 20 00    	jmpq   *0x201dc2(%rip)        # 202f08 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@GLIBCXX_3.4.21>
    1146:	68 06 00 00 00       	pushq  $0x6
    114b:	e9 80 ff ff ff       	jmpq   10d0 <.plt>

0000000000001150 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>:
    1150:	ff 25 ba 1d 20 00    	jmpq   *0x201dba(%rip)        # 202f10 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    1156:	68 07 00 00 00       	pushq  $0x7
    115b:	e9 70 ff ff ff       	jmpq   10d0 <.plt>

0000000000001160 <_ZNSirsERi@plt>:
    1160:	ff 25 b2 1d 20 00    	jmpq   *0x201db2(%rip)        # 202f18 <_ZNSirsERi@GLIBCXX_3.4>
    1166:	68 08 00 00 00       	pushq  $0x8
    116b:	e9 60 ff ff ff       	jmpq   10d0 <.plt>

0000000000001170 <waitpid@plt>:
    1170:	ff 25 aa 1d 20 00    	jmpq   *0x201daa(%rip)        # 202f20 <waitpid@GLIBC_2.2.5>
    1176:	68 09 00 00 00       	pushq  $0x9
    117b:	e9 50 ff ff ff       	jmpq   10d0 <.plt>

0000000000001180 <__cxa_atexit@plt>:
    1180:	ff 25 a2 1d 20 00    	jmpq   *0x201da2(%rip)        # 202f28 <__cxa_atexit@GLIBC_2.2.5>
    1186:	68 0a 00 00 00       	pushq  $0xa
    118b:	e9 40 ff ff ff       	jmpq   10d0 <.plt>

0000000000001190 <_ZdlPv@plt>:
    1190:	ff 25 9a 1d 20 00    	jmpq   *0x201d9a(%rip)        # 202f30 <_ZdlPv@GLIBCXX_3.4>
    1196:	68 0b 00 00 00       	pushq  $0xb
    119b:	e9 30 ff ff ff       	jmpq   10d0 <.plt>

00000000000011a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
    11a0:	ff 25 92 1d 20 00    	jmpq   *0x201d92(%rip)        # 202f38 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@GLIBCXX_3.4>
    11a6:	68 0c 00 00 00       	pushq  $0xc
    11ab:	e9 20 ff ff ff       	jmpq   10d0 <.plt>

00000000000011b0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@plt>:
    11b0:	ff 25 8a 1d 20 00    	jmpq   *0x201d8a(%rip)        # 202f40 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@GLIBCXX_3.4>
    11b6:	68 0d 00 00 00       	pushq  $0xd
    11bb:	e9 10 ff ff ff       	jmpq   10d0 <.plt>

00000000000011c0 <__stack_chk_fail@plt>:
    11c0:	ff 25 82 1d 20 00    	jmpq   *0x201d82(%rip)        # 202f48 <__stack_chk_fail@GLIBC_2.4>
    11c6:	68 0e 00 00 00       	pushq  $0xe
    11cb:	e9 00 ff ff ff       	jmpq   10d0 <.plt>

00000000000011d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>:
    11d0:	ff 25 7a 1d 20 00    	jmpq   *0x201d7a(%rip)        # 202f50 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@GLIBCXX_3.4.9>
    11d6:	68 0f 00 00 00       	pushq  $0xf
    11db:	e9 f0 fe ff ff       	jmpq   10d0 <.plt>

00000000000011e0 <getenv@plt>:
    11e0:	ff 25 72 1d 20 00    	jmpq   *0x201d72(%rip)        # 202f58 <getenv@GLIBC_2.2.5>
    11e6:	68 10 00 00 00       	pushq  $0x10
    11eb:	e9 e0 fe ff ff       	jmpq   10d0 <.plt>

00000000000011f0 <shmat@plt>:
    11f0:	ff 25 6a 1d 20 00    	jmpq   *0x201d6a(%rip)        # 202f60 <shmat@GLIBC_2.2.5>
    11f6:	68 11 00 00 00       	pushq  $0x11
    11fb:	e9 d0 fe ff ff       	jmpq   10d0 <.plt>

0000000000001200 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv@plt>:
    1200:	ff 25 62 1d 20 00    	jmpq   *0x201d62(%rip)        # 202f68 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv@GLIBCXX_3.4>
    1206:	68 12 00 00 00       	pushq  $0x12
    120b:	e9 c0 fe ff ff       	jmpq   10d0 <.plt>

0000000000001210 <read@plt>:
    1210:	ff 25 5a 1d 20 00    	jmpq   *0x201d5a(%rip)        # 202f70 <read@GLIBC_2.2.5>
    1216:	68 13 00 00 00       	pushq  $0x13
    121b:	e9 b0 fe ff ff       	jmpq   10d0 <.plt>

0000000000001220 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>:
    1220:	ff 25 52 1d 20 00    	jmpq   *0x201d52(%rip)        # 202f78 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@GLIBCXX_3.4>
    1226:	68 14 00 00 00       	pushq  $0x14
    122b:	e9 a0 fe ff ff       	jmpq   10d0 <.plt>

0000000000001230 <_ZNSt8ios_base4InitC1Ev@plt>:
    1230:	ff 25 4a 1d 20 00    	jmpq   *0x201d4a(%rip)        # 202f80 <_ZNSt8ios_base4InitC1Ev@GLIBCXX_3.4>
    1236:	68 15 00 00 00       	pushq  $0x15
    123b:	e9 90 fe ff ff       	jmpq   10d0 <.plt>

0000000000001240 <puts@plt>:
    1240:	ff 25 42 1d 20 00    	jmpq   *0x201d42(%rip)        # 202f88 <puts@GLIBC_2.2.5>
    1246:	68 16 00 00 00       	pushq  $0x16
    124b:	e9 80 fe ff ff       	jmpq   10d0 <.plt>

0000000000001250 <atoi@plt>:
    1250:	ff 25 3a 1d 20 00    	jmpq   *0x201d3a(%rip)        # 202f90 <atoi@GLIBC_2.2.5>
    1256:	68 17 00 00 00       	pushq  $0x17
    125b:	e9 70 fe ff ff       	jmpq   10d0 <.plt>

0000000000001260 <_exit@plt>:
    1260:	ff 25 32 1d 20 00    	jmpq   *0x201d32(%rip)        # 202f98 <_exit@GLIBC_2.2.5>
    1266:	68 18 00 00 00       	pushq  $0x18
    126b:	e9 60 fe ff ff       	jmpq   10d0 <.plt>

0000000000001270 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEC1ERKNS_12basic_stringIcS2_S3_EESt13_Ios_Openmode@plt>:
    1270:	ff 25 2a 1d 20 00    	jmpq   *0x201d2a(%rip)        # 202fa0 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEC1ERKNS_12basic_stringIcS2_S3_EESt13_Ios_Openmode@GLIBCXX_3.4.21>
    1276:	68 19 00 00 00       	pushq  $0x19
    127b:	e9 50 fe ff ff       	jmpq   10d0 <.plt>

0000000000001280 <_ZNSolsEi@plt>:
    1280:	ff 25 22 1d 20 00    	jmpq   *0x201d22(%rip)        # 202fa8 <_ZNSolsEi@GLIBCXX_3.4>
    1286:	68 1a 00 00 00       	pushq  $0x1a
    128b:	e9 40 fe ff ff       	jmpq   10d0 <.plt>

0000000000001290 <_Unwind_Resume@plt>:
    1290:	ff 25 1a 1d 20 00    	jmpq   *0x201d1a(%rip)        # 202fb0 <_Unwind_Resume@GCC_3.0>
    1296:	68 1b 00 00 00       	pushq  $0x1b
    129b:	e9 30 fe ff ff       	jmpq   10d0 <.plt>

00000000000012a0 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@plt>:
    12a0:	ff 25 12 1d 20 00    	jmpq   *0x201d12(%rip)        # 202fb8 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@GLIBCXX_3.4>
    12a6:	68 1c 00 00 00       	pushq  $0x1c
    12ab:	e9 20 fe ff ff       	jmpq   10d0 <.plt>

00000000000012b0 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@plt>:
    12b0:	ff 25 0a 1d 20 00    	jmpq   *0x201d0a(%rip)        # 202fc0 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@GLIBCXX_3.4.21>
    12b6:	68 1d 00 00 00       	pushq  $0x1d
    12bb:	e9 10 fe ff ff       	jmpq   10d0 <.plt>

00000000000012c0 <close@plt>:
    12c0:	ff 25 02 1d 20 00    	jmpq   *0x201d02(%rip)        # 202fc8 <close@GLIBC_2.2.5>
    12c6:	68 1e 00 00 00       	pushq  $0x1e
    12cb:	e9 00 fe ff ff       	jmpq   10d0 <.plt>

Disassembly of section .plt.got:

00000000000012d0 <__cxa_finalize@plt>:
    12d0:	ff 25 fa 1c 20 00    	jmpq   *0x201cfa(%rip)        # 202fd0 <__cxa_finalize@GLIBC_2.2.5>
    12d6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000012e0 <main>:
    12e0:	e8 63 0c 00 00       	callq  1f48 <__afl_setup_first>
    12e5:	3c 7f                	cmp    $0x7f,%al
    12e7:	48 c7 05 86 1e 20 00 	movq   $0x1,0x201e86(%rip)        # 203178 <instswitch>
    12ee:	01 00 00 00 
    12f2:	75 1a                	jne    130e <runSUT>
    12f4:	48 8d 3d 8e 10 00 00 	lea    0x108e(%rip),%rdi        # 2389 <.serverSetupError>
    12fb:	48 c7 05 72 1e 20 00 	movq   $0x0,0x201e72(%rip)        # 203178 <instswitch>
    1302:	00 00 00 00 
    1306:	e8 d5 fd ff ff       	callq  10e0 <printf@plt>
    130b:	48 31 c0             	xor    %rax,%rax

000000000000130e <runSUT>:
#include <string.h>
#include <fstream>
#include <sstream>
using namespace std;

int main(int argc, char** argv) {
    130e:	41 57                	push   %r15
    1310:	41 56                	push   %r14
  
  ofstream of("aaa");
    1312:	ba 30 00 00 00       	mov    $0x30,%edx
int main(int argc, char** argv) {
    1317:	41 55                	push   %r13
    1319:	41 54                	push   %r12
    131b:	55                   	push   %rbp
    131c:	53                   	push   %rbx
    131d:	48 89 f3             	mov    %rsi,%rbx
  ofstream of("aaa");
    1320:	48 8d 35 1d 12 00 00 	lea    0x121d(%rip),%rsi        # 2544 <_IO_stdin_used+0x4>
int main(int argc, char** argv) {
    1327:	89 fd                	mov    %edi,%ebp
    1329:	48 81 ec 28 09 00 00 	sub    $0x928,%rsp
  ofstream of("aaa");
    1330:	4c 8d ac 24 10 05 00 	lea    0x510(%rsp),%r13
    1337:	00 
int main(int argc, char** argv) {
    1338:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    133f:	00 00 
    1341:	48 89 84 24 18 09 00 	mov    %rax,0x918(%rsp)
    1348:	00 
    1349:	31 c0                	xor    %eax,%eax
  ofstream of("aaa");
    134b:	4c 89 ef             	mov    %r13,%rdi
    134e:	e8 5d fe ff ff       	callq  11b0 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@plt>
      /**
       *  @brief  Returns true if the external file is open.
       */
      bool
      is_open() const throw()
      { return _M_file.is_open(); }
    1353:	49 8d 7d 70          	lea    0x70(%r13),%rdi
    1357:	e8 a4 fd ff ff       	callq  1100 <_ZNKSt12__basic_fileIcE7is_openEv@plt>
  if (of.is_open()) {
    135c:	84 c0                	test   %al,%al
    135e:	0f 85 7c 06 00 00    	jne    19e0 <runSUT+0x6d2>
    1364:	50                   	push   %rax
    1365:	48 c7 c0 d2 b2 99 7e 	mov    $0x7e99b2d2,%rax
    136c:	48 89 05 cd 1d 20 00 	mov    %rax,0x201dcd(%rip)        # 203140 <edgeId>
    1373:	58                   	pop    %rax
    1374:	e8 a5 0a 00 00       	callq  1e1e <_storeEdge>
    1379:	50                   	push   %rax
    137a:	48 c7 c0 69 d9 4c 3f 	mov    $0x3f4cd969,%rax
    1381:	48 89 05 b8 1d 20 00 	mov    %rax,0x201db8(%rip)        # 203140 <edgeId>
    1388:	58                   	pop    %rax
    1389:	e8 90 0a 00 00       	callq  1e1e <_storeEdge>
    of << argv[0] << endl;
    of << argv[1] << endl;
    of.close();
  }
  
  if (argc != 2) {
    138e:	48 89 15 bb 1d 20 00 	mov    %rdx,0x201dbb(%rip)        # 203150 <tmpquadone>
    1395:	48 89 0d ec 1d 20 00 	mov    %rcx,0x201dec(%rip)        # 203188 <tmpquadtwo>
    139c:	48 8d 15 fd 1d 20 00 	lea    0x201dfd(%rip),%rdx        # 2031a0 <funcinptr>
    13a3:	48 c7 02 01 00 00 00 	movq   $0x1,(%rdx)
    13aa:	48 c7 42 08 6c 00 00 	movq   $0x6c,0x8(%rdx)
    13b1:	00 
    13b2:	48 c7 c1 02 00 00 00 	mov    $0x2,%rcx
    13b9:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
    13bd:	48 c7 42 18 00 00 00 	movq   $0x0,0x18(%rdx)
    13c4:	00 
    13c5:	48 89 e9             	mov    %rbp,%rcx
    13c8:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
    13cc:	48 c7 42 28 00 00 00 	movq   $0x0,0x28(%rdx)
    13d3:	00 
    13d4:	ff 32                	pushq  (%rdx)
    13d6:	48 8b 15 73 1d 20 00 	mov    0x201d73(%rip),%rdx        # 203150 <tmpquadone>
    13dd:	48 8b 0d a4 1d 20 00 	mov    0x201da4(%rip),%rcx        # 203188 <tmpquadtwo>
    13e4:	48 c7 05 79 1d 20 00 	movq   $0x1,0x201d79(%rip)        # 203168 <cmpPassed>
    13eb:	01 00 00 00 
    13ef:	e8 9c 0a 00 00       	callq  1e90 <_storeDataFn>
    13f4:	83 fd 02             	cmp    $0x2,%ebp
    13f7:	0f 85 99 06 00 00    	jne    1a96 <runSUT+0x788>
    13fd:	50                   	push   %rax
    13fe:	48 c7 c0 2d 9b e9 47 	mov    $0x47e99b2d,%rax
    1405:	48 89 05 34 1d 20 00 	mov    %rax,0x201d34(%rip)        # 203140 <edgeId>
    140c:	58                   	pop    %rax
    140d:	e8 0c 0a 00 00       	callq  1e1e <_storeEdge>
   return -1;
  }
  char* path = argv[1];

  cout << argv[0] << endl;
    1412:	48 8b 33             	mov    (%rbx),%rsi
    1415:	48 8d 3d 04 1c 20 00 	lea    0x201c04(%rip),%rdi        # 203020 <_ZSt4cout@@GLIBCXX_3.4>
  char* path = argv[1];
    141c:	4c 8b 63 08          	mov    0x8(%rbx),%r12
  cout << argv[0] << endl;
    1420:	e8 7b fd ff ff       	callq  11a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
      operator<<(__ostream_type& (*__pf)(__ostream_type&))
      {
	// _GLIBCXX_RESOLVE_LIB_DEFECTS
	// DR 60. What is a formatted input function?
	// The inserters for manipulators are *not* formatted output functions.
	return __pf(*this);
    1425:	48 89 c7             	mov    %rax,%rdi
    1428:	e8 23 fd ff ff       	callq  1150 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
  cout << argv[1] << endl;
    142d:	48 8b 73 08          	mov    0x8(%rbx),%rsi
    1431:	48 8d 3d e8 1b 20 00 	lea    0x201be8(%rip),%rdi        # 203020 <_ZSt4cout@@GLIBCXX_3.4>
    1438:	e8 63 fd ff ff       	callq  11a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    143d:	48 89 c7             	mov    %rax,%rdi
    1440:	e8 0b fd ff ff       	callq  1150 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
  ifstream t(path);
    1445:	4c 8d bc 24 10 07 00 	lea    0x710(%rsp),%r15
    144c:	00 
    144d:	ba 08 00 00 00       	mov    $0x8,%edx
    1452:	4c 89 e6             	mov    %r12,%rsi
    1455:	4c 89 ff             	mov    %r15,%rdi
    1458:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
    145d:	e8 3e fe ff ff       	callq  12a0 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@plt>
#else
	_Alloc_hider(pointer __dat, const _Alloc& __a)
	: allocator_type(__a), _M_p(__dat) { }

	_Alloc_hider(pointer __dat, _Alloc&& __a = _Alloc())
	: allocator_type(std::move(__a)), _M_p(__dat) { }
    1462:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
  string line;

  getline(t, line);
    1467:	4c 89 ff             	mov    %r15,%rdi
      _M_data(pointer __p)
      { _M_dataplus._M_p = __p; }

      void
      _M_length(size_type __length)
      { _M_string_length = __length; }
    146a:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    1471:	00 00 
      typedef streamoff         off_type;
      typedef mbstate_t         state_type;

      static _GLIBCXX17_CONSTEXPR void
      assign(char_type& __c1, const char_type& __c2) _GLIBCXX_NOEXCEPT
      { __c1 = __c2; }
    1473:	c6 44 24 40 00       	movb   $0x0,0x40(%rsp)
	: allocator_type(std::move(__a)), _M_p(__dat) { }
    1478:	48 8d 43 10          	lea    0x10(%rbx),%rax
    147c:	48 89 de             	mov    %rbx,%rsi
    147f:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    1484:	e8 67 fc ff ff       	callq  10f0 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EE@plt>
    operator<<(basic_ostream<_CharT, _Traits>& __os,
	       const basic_string<_CharT, _Traits, _Alloc>& __str)
    {
      // _GLIBCXX_RESOLVE_LIB_DEFECTS
      // 586. string inserter not a formatted function
      return __ostream_insert(__os, __str.data(), __str.size());
    1489:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    148e:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    1493:	48 8d 3d 86 1b 20 00 	lea    0x201b86(%rip),%rdi        # 203020 <_ZSt4cout@@GLIBCXX_3.4>
    149a:	e8 31 fd ff ff       	callq  11d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    149f:	48 89 c7             	mov    %rax,%rdi
    14a2:	e8 a9 fc ff ff       	callq  1150 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>

  cout << line << endl;
  if (line[12] == 'a') {
    14a7:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    14ac:	48 89 0d 9d 1c 20 00 	mov    %rcx,0x201c9d(%rip)        # 203150 <tmpquadone>
    14b3:	48 89 1d ce 1c 20 00 	mov    %rbx,0x201cce(%rip)        # 203188 <tmpquadtwo>
    14ba:	48 8d 0d df 1c 20 00 	lea    0x201cdf(%rip),%rcx        # 2031a0 <funcinptr>
    14c1:	48 c7 01 02 00 00 00 	movq   $0x2,(%rcx)
    14c8:	48 c7 41 08 62 00 00 	movq   $0x62,0x8(%rcx)
    14cf:	00 
    14d0:	48 c7 c3 61 00 00 00 	mov    $0x61,%rbx
    14d7:	48 89 59 10          	mov    %rbx,0x10(%rcx)
    14db:	48 c7 41 18 00 00 00 	movq   $0x0,0x18(%rcx)
    14e2:	00 
    14e3:	48 8b 5a 0c          	mov    0xc(%rdx),%rbx
    14e7:	48 89 59 20          	mov    %rbx,0x20(%rcx)
    14eb:	48 c7 41 28 00 00 00 	movq   $0x0,0x28(%rcx)
    14f2:	00 
    14f3:	ff 31                	pushq  (%rcx)
    14f5:	48 8b 0d 54 1c 20 00 	mov    0x201c54(%rip),%rcx        # 203150 <tmpquadone>
    14fc:	48 8b 1d 85 1c 20 00 	mov    0x201c85(%rip),%rbx        # 203188 <tmpquadtwo>
    1503:	48 c7 05 5a 1c 20 00 	movq   $0x1,0x201c5a(%rip)        # 203168 <cmpPassed>
    150a:	01 00 00 00 
    150e:	e8 7d 09 00 00       	callq  1e90 <_storeDataFn>
    1513:	80 7a 0c 61          	cmpb   $0x61,0xc(%rdx)
    1517:	0f 84 0f 05 00 00    	je     1a2c <runSUT+0x71e>
    151d:	50                   	push   %rax
    151e:	48 b8 5c 14 e9 df 00 	movabs $0xdfe9145c,%rax
    1525:	00 00 00 
    1528:	48 89 05 11 1c 20 00 	mov    %rax,0x201c11(%rip)        # 203140 <edgeId>
    152f:	58                   	pop    %rax
    1530:	e8 e9 08 00 00       	callq  1e1e <_storeEdge>
    1535:	50                   	push   %rax
    1536:	48 c7 c0 2e 8a f4 6f 	mov    $0x6ff48a2e,%rax
    153d:	48 89 05 fc 1b 20 00 	mov    %rax,0x201bfc(%rip)        # 203140 <edgeId>
    1544:	58                   	pop    %rax
    1545:	e8 d4 08 00 00       	callq  1e1e <_storeEdge>
    cout << "AAA" << endl;
  }
  istringstream iss(line);
    154a:	4c 8d b4 24 90 00 00 	lea    0x90(%rsp),%r14
    1551:	00 
    1552:	ba 08 00 00 00       	mov    $0x8,%edx
    1557:	48 89 de             	mov    %rbx,%rsi
    155a:	4c 89 f7             	mov    %r14,%rdi
    155d:	e8 0e fd ff ff       	callq  1270 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEC1ERKNS_12basic_stringIcS2_S3_EESt13_Ios_Openmode@plt>
	: allocator_type(std::move(__a)), _M_p(__dat) { }
    1562:	4c 8d 64 24 70       	lea    0x70(%rsp),%r12
    1567:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  string token;
  string token2;
  int val1;
  int val2;
  getline(iss, token, ' ');
    156c:	ba 20 00 00 00       	mov    $0x20,%edx
    1571:	4c 89 f7             	mov    %r14,%rdi
      { _M_string_length = __length; }
    1574:	48 c7 44 24 58 00 00 	movq   $0x0,0x58(%rsp)
    157b:	00 00 
    157d:	c6 44 24 60 00       	movb   $0x0,0x60(%rsp)
	: allocator_type(std::move(__a)), _M_p(__dat) { }
    1582:	49 8d 74 24 10       	lea    0x10(%r12),%rsi
    1587:	48 8d 4d 10          	lea    0x10(%rbp),%rcx
      { _M_string_length = __length; }
    158b:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
    1592:	00 00 
    1594:	c6 84 24 80 00 00 00 	movb   $0x0,0x80(%rsp)
    159b:	00 
	: allocator_type(std::move(__a)), _M_p(__dat) { }
    159c:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
    15a1:	48 89 ee             	mov    %rbp,%rsi
    15a4:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
    15a9:	e8 02 fd ff ff       	callq  12b0 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@plt>
  getline(iss, token2, ' ');
    15ae:	ba 20 00 00 00       	mov    $0x20,%edx
    15b3:	4c 89 e6             	mov    %r12,%rsi
    15b6:	4c 89 f7             	mov    %r14,%rdi
    15b9:	e8 f2 fc ff ff       	callq  12b0 <_ZSt7getlineIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RNSt7__cxx1112basic_stringIS4_S5_T1_EES4_@plt>
  istringstream isstoken(token);
    15be:	48 8d bc 24 10 02 00 	lea    0x210(%rsp),%rdi
    15c5:	00 
    15c6:	ba 08 00 00 00       	mov    $0x8,%edx
    15cb:	48 89 ee             	mov    %rbp,%rsi
    15ce:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    15d3:	e8 98 fc ff ff       	callq  1270 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEC1ERKNS_12basic_stringIcS2_S3_EESt13_Ios_Openmode@plt>
  istringstream isstoken2(token2);
    15d8:	4c 8d bc 24 90 03 00 	lea    0x390(%rsp),%r15
    15df:	00 
    15e0:	ba 08 00 00 00       	mov    $0x8,%edx
    15e5:	4c 89 e6             	mov    %r12,%rsi
    15e8:	4c 89 ff             	mov    %r15,%rdi
    15eb:	e8 80 fc ff ff       	callq  1270 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEEC1ERKNS_12basic_stringIcS2_S3_EESt13_Ios_Openmode@plt>
  isstoken >> val1;
    15f0:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    15f5:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
    15fa:	e8 61 fb ff ff       	callq  1160 <_ZNSirsERi@plt>
  isstoken2 >> val2;
    15ff:	48 8d 74 24 2c       	lea    0x2c(%rsp),%rsi
    1604:	4c 89 ff             	mov    %r15,%rdi
    1607:	e8 54 fb ff ff       	callq  1160 <_ZNSirsERi@plt>
  cout << val1  << " " << val2 << endl;
    160c:	8b 74 24 28          	mov    0x28(%rsp),%esi
    1610:	48 8d 3d 09 1a 20 00 	lea    0x201a09(%rip),%rdi        # 203020 <_ZSt4cout@@GLIBCXX_3.4>
    1617:	e8 64 fc ff ff       	callq  1280 <_ZNSolsEi@plt>
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
    161c:	48 8d 35 2e 0f 00 00 	lea    0xf2e(%rip),%rsi        # 2551 <_IO_stdin_used+0x11>
    1623:	ba 01 00 00 00       	mov    $0x1,%edx
    1628:	48 89 c7             	mov    %rax,%rdi
    162b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1630:	e8 9b fb ff ff       	callq  11d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
    1635:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
    1639:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
    163e:	e8 3d fc ff ff       	callq  1280 <_ZNSolsEi@plt>
	return __pf(*this);
    1643:	48 89 c7             	mov    %rax,%rdi
    1646:	e8 05 fb ff ff       	callq  1150 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
  if (val1 == 65535) {
    164b:	48 89 15 fe 1a 20 00 	mov    %rdx,0x201afe(%rip)        # 203150 <tmpquadone>
    1652:	48 89 0d 2f 1b 20 00 	mov    %rcx,0x201b2f(%rip)        # 203188 <tmpquadtwo>
    1659:	48 8d 15 40 1b 20 00 	lea    0x201b40(%rip),%rdx        # 2031a0 <funcinptr>
    1660:	48 c7 02 03 00 00 00 	movq   $0x3,(%rdx)
    1667:	48 c7 42 08 6c 00 00 	movq   $0x6c,0x8(%rdx)
    166e:	00 
    166f:	48 c7 c1 ff ff 00 00 	mov    $0xffff,%rcx
    1676:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
    167a:	48 c7 42 18 00 00 00 	movq   $0x0,0x18(%rdx)
    1681:	00 
    1682:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    1687:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
    168b:	48 c7 42 28 00 00 00 	movq   $0x0,0x28(%rdx)
    1692:	00 
    1693:	ff 32                	pushq  (%rdx)
    1695:	48 8b 15 b4 1a 20 00 	mov    0x201ab4(%rip),%rdx        # 203150 <tmpquadone>
    169c:	48 8b 0d e5 1a 20 00 	mov    0x201ae5(%rip),%rcx        # 203188 <tmpquadtwo>
    16a3:	48 c7 05 ba 1a 20 00 	movq   $0x1,0x201aba(%rip)        # 203168 <cmpPassed>
    16aa:	01 00 00 00 
    16ae:	e8 dd 07 00 00       	callq  1e90 <_storeDataFn>
    16b3:	81 7c 24 28 ff ff 00 	cmpl   $0xffff,0x28(%rsp)
    16ba:	00 
    16bb:	0f 85 a0 00 00 00    	jne    1761 <runSUT+0x453>
    16c1:	50                   	push   %rax
    16c2:	48 c7 c0 03 1e 7b 0a 	mov    $0xa7b1e03,%rax
    16c9:	48 89 05 70 1a 20 00 	mov    %rax,0x201a70(%rip)        # 203140 <edgeId>
    16d0:	58                   	pop    %rax
    16d1:	e8 48 07 00 00       	callq  1e1e <_storeEdge>
    if (val2 == 65535) {
    16d6:	48 89 15 73 1a 20 00 	mov    %rdx,0x201a73(%rip)        # 203150 <tmpquadone>
    16dd:	48 89 0d a4 1a 20 00 	mov    %rcx,0x201aa4(%rip)        # 203188 <tmpquadtwo>
    16e4:	48 8d 15 b5 1a 20 00 	lea    0x201ab5(%rip),%rdx        # 2031a0 <funcinptr>
    16eb:	48 c7 02 04 00 00 00 	movq   $0x4,(%rdx)
    16f2:	48 c7 42 08 6c 00 00 	movq   $0x6c,0x8(%rdx)
    16f9:	00 
    16fa:	48 c7 c1 ff ff 00 00 	mov    $0xffff,%rcx
    1701:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
    1705:	48 c7 42 18 00 00 00 	movq   $0x0,0x18(%rdx)
    170c:	00 
    170d:	48 8b 4c 24 2c       	mov    0x2c(%rsp),%rcx
    1712:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
    1716:	48 c7 42 28 00 00 00 	movq   $0x0,0x28(%rdx)
    171d:	00 
    171e:	ff 32                	pushq  (%rdx)
    1720:	48 8b 15 29 1a 20 00 	mov    0x201a29(%rip),%rdx        # 203150 <tmpquadone>
    1727:	48 8b 0d 5a 1a 20 00 	mov    0x201a5a(%rip),%rcx        # 203188 <tmpquadtwo>
    172e:	48 c7 05 2f 1a 20 00 	movq   $0x1,0x201a2f(%rip)        # 203168 <cmpPassed>
    1735:	01 00 00 00 
    1739:	e8 52 07 00 00       	callq  1e90 <_storeDataFn>
    173e:	81 7c 24 2c ff ff 00 	cmpl   $0xffff,0x2c(%rsp)
    1745:	00 
    1746:	0f 84 21 03 00 00    	je     1a6d <runSUT+0x75f>
    174c:	50                   	push   %rax
    174d:	48 c7 c0 c0 63 4f 01 	mov    $0x14f63c0,%rax
    1754:	48 89 05 e5 19 20 00 	mov    %rax,0x2019e5(%rip)        # 203140 <edgeId>
    175b:	58                   	pop    %rax
    175c:	e8 bd 06 00 00       	callq  1e1e <_storeEdge>
    1761:	50                   	push   %rax
    1762:	48 b8 e0 b1 a7 80 00 	movabs $0x80a7b1e0,%rax
    1769:	00 00 00 
    176c:	48 89 05 cd 19 20 00 	mov    %rax,0x2019cd(%rip)        # 203140 <edgeId>
    1773:	58                   	pop    %rax
    1774:	e8 a5 06 00 00       	callq  1e1e <_storeEdge>
  istringstream isstoken2(token2);
    1779:	4c 89 ff             	mov    %r15,%rdi
	if (!_M_is_local())
    177c:	49 83 c4 10          	add    $0x10,%r12
    1780:	e8 bb f9 ff ff       	callq  1140 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@plt>
  istringstream isstoken(token);
    1785:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    178a:	e8 b1 f9 ff ff       	callq  1140 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@plt>
      { return _M_data() == _M_local_data(); }
    178f:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
	if (!_M_is_local())
    1794:	48 89 15 b5 19 20 00 	mov    %rdx,0x2019b5(%rip)        # 203150 <tmpquadone>
    179b:	48 89 0d e6 19 20 00 	mov    %rcx,0x2019e6(%rip)        # 203188 <tmpquadtwo>
    17a2:	48 8d 15 f7 19 20 00 	lea    0x2019f7(%rip),%rdx        # 2031a0 <funcinptr>
    17a9:	48 c7 02 05 00 00 00 	movq   $0x5,(%rdx)
    17b0:	48 c7 42 08 71 00 00 	movq   $0x71,0x8(%rdx)
    17b7:	00 
    17b8:	4c 89 e1             	mov    %r12,%rcx
    17bb:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
    17bf:	48 c7 42 18 00 00 00 	movq   $0x0,0x18(%rdx)
    17c6:	00 
    17c7:	48 89 f9             	mov    %rdi,%rcx
    17ca:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
    17ce:	48 c7 42 28 00 00 00 	movq   $0x0,0x28(%rdx)
    17d5:	00 
    17d6:	ff 32                	pushq  (%rdx)
    17d8:	48 8b 15 71 19 20 00 	mov    0x201971(%rip),%rdx        # 203150 <tmpquadone>
    17df:	48 8b 0d a2 19 20 00 	mov    0x2019a2(%rip),%rcx        # 203188 <tmpquadtwo>
    17e6:	48 c7 05 77 19 20 00 	movq   $0x1,0x201977(%rip)        # 203168 <cmpPassed>
    17ed:	01 00 00 00 
    17f1:	e8 9a 06 00 00       	callq  1e90 <_storeDataFn>
    17f6:	4c 39 e7             	cmp    %r12,%rdi
    17f9:	74 1a                	je     1815 <runSUT+0x507>
    17fb:	50                   	push   %rax
    17fc:	48 c7 c0 7c 07 b7 29 	mov    $0x29b7077c,%rax
    1803:	48 89 05 36 19 20 00 	mov    %rax,0x201936(%rip)        # 203140 <edgeId>
    180a:	58                   	pop    %rax
    180b:	e8 0e 06 00 00       	callq  1e1e <_storeEdge>
	  {
	    ::operator delete(__p, std::align_val_t(alignof(_Tp)));
	    return;
	  }
#endif
	::operator delete(__p);
    1810:	e8 7b f9 ff ff       	callq  1190 <_ZdlPv@plt>
    1815:	50                   	push   %rax
    1816:	48 b8 c1 6d 8a 8e 00 	movabs $0x8e8a6dc1,%rax
    181d:	00 00 00 
    1820:	48 89 05 19 19 20 00 	mov    %rax,0x201919(%rip)        # 203140 <edgeId>
    1827:	58                   	pop    %rax
    1828:	e8 f1 05 00 00       	callq  1e1e <_storeEdge>
      { return _M_data() == _M_local_data(); }
    182d:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
	if (!_M_is_local())
    1832:	48 83 c5 10          	add    $0x10,%rbp
    1836:	48 89 15 13 19 20 00 	mov    %rdx,0x201913(%rip)        # 203150 <tmpquadone>
    183d:	48 89 0d 44 19 20 00 	mov    %rcx,0x201944(%rip)        # 203188 <tmpquadtwo>
    1844:	48 8d 15 55 19 20 00 	lea    0x201955(%rip),%rdx        # 2031a0 <funcinptr>
    184b:	48 c7 02 06 00 00 00 	movq   $0x6,(%rdx)
    1852:	48 c7 42 08 71 00 00 	movq   $0x71,0x8(%rdx)
    1859:	00 
    185a:	48 89 e9             	mov    %rbp,%rcx
    185d:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
    1861:	48 c7 42 18 00 00 00 	movq   $0x0,0x18(%rdx)
    1868:	00 
    1869:	48 89 f9             	mov    %rdi,%rcx
    186c:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
    1870:	48 c7 42 28 00 00 00 	movq   $0x0,0x28(%rdx)
    1877:	00 
    1878:	ff 32                	pushq  (%rdx)
    187a:	48 8b 15 cf 18 20 00 	mov    0x2018cf(%rip),%rdx        # 203150 <tmpquadone>
    1881:	48 8b 0d 00 19 20 00 	mov    0x201900(%rip),%rcx        # 203188 <tmpquadtwo>
    1888:	48 c7 05 d5 18 20 00 	movq   $0x1,0x2018d5(%rip)        # 203168 <cmpPassed>
    188f:	01 00 00 00 
    1893:	e8 f8 05 00 00       	callq  1e90 <_storeDataFn>
    1898:	48 39 ef             	cmp    %rbp,%rdi
    189b:	74 1a                	je     18b7 <runSUT+0x5a9>
    189d:	50                   	push   %rax
    189e:	48 c7 c0 8e 3a 4e 7d 	mov    $0x7d4e3a8e,%rax
    18a5:	48 89 05 94 18 20 00 	mov    %rax,0x201894(%rip)        # 203140 <edgeId>
    18ac:	58                   	pop    %rax
    18ad:	e8 6c 05 00 00       	callq  1e1e <_storeEdge>
    18b2:	e8 d9 f8 ff ff       	callq  1190 <_ZdlPv@plt>
    18b7:	50                   	push   %rax
    18b8:	48 c7 c0 1d a7 3e 73 	mov    $0x733ea71d,%rax
    18bf:	48 89 05 7a 18 20 00 	mov    %rax,0x20187a(%rip)        # 203140 <edgeId>
    18c6:	58                   	pop    %rax
    18c7:	e8 52 05 00 00       	callq  1e1e <_storeEdge>
  istringstream iss(line);
    18cc:	4c 89 f7             	mov    %r14,%rdi
    18cf:	48 83 c3 10          	add    $0x10,%rbx
    18d3:	e8 68 f8 ff ff       	callq  1140 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@plt>
      { return _M_data() == _M_local_data(); }
    18d8:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
	if (!_M_is_local())
    18dd:	48 89 15 6c 18 20 00 	mov    %rdx,0x20186c(%rip)        # 203150 <tmpquadone>
    18e4:	48 89 0d 9d 18 20 00 	mov    %rcx,0x20189d(%rip)        # 203188 <tmpquadtwo>
    18eb:	48 8d 15 ae 18 20 00 	lea    0x2018ae(%rip),%rdx        # 2031a0 <funcinptr>
    18f2:	48 c7 02 07 00 00 00 	movq   $0x7,(%rdx)
    18f9:	48 c7 42 08 71 00 00 	movq   $0x71,0x8(%rdx)
    1900:	00 
    1901:	48 89 d9             	mov    %rbx,%rcx
    1904:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
    1908:	48 c7 42 18 00 00 00 	movq   $0x0,0x18(%rdx)
    190f:	00 
    1910:	48 89 f9             	mov    %rdi,%rcx
    1913:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
    1917:	48 c7 42 28 00 00 00 	movq   $0x0,0x28(%rdx)
    191e:	00 
    191f:	ff 32                	pushq  (%rdx)
    1921:	48 8b 15 28 18 20 00 	mov    0x201828(%rip),%rdx        # 203150 <tmpquadone>
    1928:	48 8b 0d 59 18 20 00 	mov    0x201859(%rip),%rcx        # 203188 <tmpquadtwo>
    192f:	48 c7 05 2e 18 20 00 	movq   $0x1,0x20182e(%rip)        # 203168 <cmpPassed>
    1936:	01 00 00 00 
    193a:	e8 51 05 00 00       	callq  1e90 <_storeDataFn>
    193f:	48 39 df             	cmp    %rbx,%rdi
    1942:	74 1a                	je     195e <runSUT+0x650>
    1944:	50                   	push   %rax
    1945:	48 c7 c0 43 74 18 5f 	mov    $0x5f187443,%rax
    194c:	48 89 05 ed 17 20 00 	mov    %rax,0x2017ed(%rip)        # 203140 <edgeId>
    1953:	58                   	pop    %rax
    1954:	e8 c5 04 00 00       	callq  1e1e <_storeEdge>
    1959:	e8 32 f8 ff ff       	callq  1190 <_ZdlPv@plt>
    195e:	50                   	push   %rax
    195f:	48 b8 3a 8c af bb 00 	movabs $0xbbaf8c3a,%rax
    1966:	00 00 00 
    1969:	48 89 05 d0 17 20 00 	mov    %rax,0x2017d0(%rip)        # 203140 <edgeId>
    1970:	58                   	pop    %rax
    1971:	e8 a8 04 00 00       	callq  1e1e <_storeEdge>
  ifstream t(path);
    1976:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    197b:	e8 90 f7 ff ff       	callq  1110 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@plt>
  ofstream of("aaa");
    1980:	4c 89 ef             	mov    %r13,%rdi
    1983:	e8 98 f8 ff ff       	callq  1220 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>
     printf("mystr \n");
    }
  }
}
    1988:	31 c0                	xor    %eax,%eax
    198a:	50                   	push   %rax
    198b:	48 b8 ba 8b 44 d4 00 	movabs $0xd4448bba,%rax
    1992:	00 00 00 
    1995:	48 89 05 a4 17 20 00 	mov    %rax,0x2017a4(%rip)        # 203140 <edgeId>
    199c:	58                   	pop    %rax
    199d:	e8 7c 04 00 00       	callq  1e1e <_storeEdge>
    19a2:	48 8b 8c 24 18 09 00 	mov    0x918(%rsp),%rcx
    19a9:	00 
    19aa:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    19b1:	00 00 
    19b3:	0f 85 02 01 00 00    	jne    1abb <runSUT+0x7ad>
    19b9:	50                   	push   %rax
    19ba:	48 c7 c0 77 91 88 1a 	mov    $0x1a889177,%rax
    19c1:	48 89 05 78 17 20 00 	mov    %rax,0x201778(%rip)        # 203140 <edgeId>
    19c8:	58                   	pop    %rax
    19c9:	e8 50 04 00 00       	callq  1e1e <_storeEdge>
    19ce:	48 81 c4 28 09 00 00 	add    $0x928,%rsp
    19d5:	5b                   	pop    %rbx
    19d6:	5d                   	pop    %rbp
    19d7:	41 5c                	pop    %r12
    19d9:	41 5d                	pop    %r13
    19db:	41 5e                	pop    %r14
    19dd:	41 5f                	pop    %r15
    19df:	c3                   	retq   
    19e0:	50                   	push   %rax
    19e1:	48 b8 a2 c6 3f 9a 00 	movabs $0x9a3fc6a2,%rax
    19e8:	00 00 00 
    19eb:	48 89 05 4e 17 20 00 	mov    %rax,0x20174e(%rip)        # 203140 <edgeId>
    19f2:	58                   	pop    %rax
    19f3:	e8 26 04 00 00       	callq  1e1e <_storeEdge>
    of << argv[0] << endl;
    19f8:	48 8b 33             	mov    (%rbx),%rsi
    19fb:	4c 89 ef             	mov    %r13,%rdi
    19fe:	e8 9d f7 ff ff       	callq  11a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1a03:	48 89 c7             	mov    %rax,%rdi
    1a06:	e8 45 f7 ff ff       	callq  1150 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    of << argv[1] << endl;
    1a0b:	48 8b 73 08          	mov    0x8(%rbx),%rsi
    1a0f:	4c 89 ef             	mov    %r13,%rdi
    1a12:	e8 89 f7 ff ff       	callq  11a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    1a17:	48 89 c7             	mov    %rax,%rdi
    1a1a:	e8 31 f7 ff ff       	callq  1150 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    of.close();
    1a1f:	4c 89 ef             	mov    %r13,%rdi
    1a22:	e8 d9 f7 ff ff       	callq  1200 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv@plt>
    1a27:	e9 4d f9 ff ff       	jmpq   1379 <runSUT+0x6b>
    1a2c:	50                   	push   %rax
    1a2d:	48 b8 35 23 fc ff 00 	movabs $0xfffc2335,%rax
    1a34:	00 00 00 
    1a37:	48 89 05 02 17 20 00 	mov    %rax,0x201702(%rip)        # 203140 <edgeId>
    1a3e:	58                   	pop    %rax
    1a3f:	e8 da 03 00 00       	callq  1e1e <_storeEdge>
	__ostream_insert(__out, __s,
    1a44:	48 8d 35 fd 0a 00 00 	lea    0xafd(%rip),%rsi        # 2548 <_IO_stdin_used+0x8>
    1a4b:	48 8d 3d ce 15 20 00 	lea    0x2015ce(%rip),%rdi        # 203020 <_ZSt4cout@@GLIBCXX_3.4>
    1a52:	ba 03 00 00 00       	mov    $0x3,%edx
    1a57:	e8 74 f7 ff ff       	callq  11d0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@plt>
	return __pf(*this);
    1a5c:	48 8d 3d bd 15 20 00 	lea    0x2015bd(%rip),%rdi        # 203020 <_ZSt4cout@@GLIBCXX_3.4>
    1a63:	e8 e8 f6 ff ff       	callq  1150 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@plt>
    1a68:	e9 c8 fa ff ff       	jmpq   1535 <runSUT+0x227>
    1a6d:	50                   	push   %rax
    1a6e:	48 b8 ff a7 e2 d4 00 	movabs $0xd4e2a7ff,%rax
    1a75:	00 00 00 
    1a78:	48 89 05 c1 16 20 00 	mov    %rax,0x2016c1(%rip)        # 203140 <edgeId>
    1a7f:	58                   	pop    %rax
    1a80:	e8 99 03 00 00       	callq  1e1e <_storeEdge>
}

__fortify_function int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
    1a85:	48 8d 3d c0 0a 00 00 	lea    0xac0(%rip),%rdi        # 254c <_IO_stdin_used+0xc>
    1a8c:	e8 af f7 ff ff       	callq  1240 <puts@plt>
    1a91:	e9 cb fc ff ff       	jmpq   1761 <runSUT+0x453>
    1a96:	50                   	push   %rax
    1a97:	48 c7 c0 8a 53 db 6d 	mov    $0x6ddb538a,%rax
    1a9e:	48 89 05 9b 16 20 00 	mov    %rax,0x20169b(%rip)        # 203140 <edgeId>
    1aa5:	58                   	pop    %rax
    1aa6:	e8 73 03 00 00       	callq  1e1e <_storeEdge>
   return -1;
    1aab:	4c 89 ef             	mov    %r13,%rdi
    1aae:	e8 6d f7 ff ff       	callq  1220 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>
    1ab3:	83 c8 ff             	or     $0xffffffff,%eax
    1ab6:	e9 cf fe ff ff       	jmpq   198a <runSUT+0x67c>
    1abb:	50                   	push   %rax
    1abc:	48 b8 d4 76 9b e4 00 	movabs $0xe49b76d4,%rax
    1ac3:	00 00 00 
    1ac6:	48 89 05 73 16 20 00 	mov    %rax,0x201673(%rip)        # 203140 <edgeId>
    1acd:	58                   	pop    %rax
    1ace:	e8 4b 03 00 00       	callq  1e1e <_storeEdge>
}
    1ad3:	e8 e8 f6 ff ff       	callq  11c0 <__stack_chk_fail@plt>
    1ad8:	50                   	push   %rax
    1ad9:	48 c7 c0 6d b7 49 4e 	mov    $0x4e49b76d,%rax
    1ae0:	48 89 05 59 16 20 00 	mov    %rax,0x201659(%rip)        # 203140 <edgeId>
    1ae7:	58                   	pop    %rax
    1ae8:	e8 31 03 00 00       	callq  1e1e <_storeEdge>
    1aed:	49 89 c7             	mov    %rax,%r15
    1af0:	50                   	push   %rax
    1af1:	48 b8 ed 36 c9 e9 00 	movabs $0xe9c936ed,%rax
    1af8:	00 00 00 
    1afb:	48 89 05 3e 16 20 00 	mov    %rax,0x20163e(%rip)        # 203140 <edgeId>
    1b02:	58                   	pop    %rax
    1b03:	e8 16 03 00 00       	callq  1e1e <_storeEdge>
  ofstream of("aaa");
    1b08:	4c 89 ef             	mov    %r13,%rdi
    1b0b:	e8 10 f7 ff ff       	callq  1220 <_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@plt>
    1b10:	4c 89 ff             	mov    %r15,%rdi
    1b13:	e8 78 f7 ff ff       	callq  1290 <_Unwind_Resume@plt>
    1b18:	50                   	push   %rax
    1b19:	48 c7 c0 4d 72 fa 39 	mov    $0x39fa724d,%rax
    1b20:	48 89 05 19 16 20 00 	mov    %rax,0x201619(%rip)        # 203140 <edgeId>
    1b27:	58                   	pop    %rax
    1b28:	e8 f1 02 00 00       	callq  1e1e <_storeEdge>
  istringstream isstoken2(token2);
    1b2d:	4c 89 ff             	mov    %r15,%rdi
    1b30:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    1b35:	e8 06 f6 ff ff       	callq  1140 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@plt>
    1b3a:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
    1b3f:	50                   	push   %rax
    1b40:	48 c7 c0 e4 f4 73 52 	mov    $0x5273f4e4,%rax
    1b47:	48 89 05 f2 15 20 00 	mov    %rax,0x2015f2(%rip)        # 203140 <edgeId>
    1b4e:	58                   	pop    %rax
    1b4f:	e8 ca 02 00 00       	callq  1e1e <_storeEdge>
  istringstream isstoken(token);
    1b54:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1b59:	e8 e2 f5 ff ff       	callq  1140 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@plt>
    1b5e:	50                   	push   %rax
    1b5f:	48 c7 c0 a7 9f 93 32 	mov    $0x32939fa7,%rax
    1b66:	48 89 05 d3 15 20 00 	mov    %rax,0x2015d3(%rip)        # 203140 <edgeId>
    1b6d:	58                   	pop    %rax
    1b6e:	e8 ab 02 00 00       	callq  1e1e <_storeEdge>
      { return _M_data() == _M_local_data(); }
    1b73:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
	if (!_M_is_local())
    1b78:	49 83 c4 10          	add    $0x10,%r12
    1b7c:	48 89 15 cd 15 20 00 	mov    %rdx,0x2015cd(%rip)        # 203150 <tmpquadone>
    1b83:	48 89 0d fe 15 20 00 	mov    %rcx,0x2015fe(%rip)        # 203188 <tmpquadtwo>
    1b8a:	48 8d 15 0f 16 20 00 	lea    0x20160f(%rip),%rdx        # 2031a0 <funcinptr>
    1b91:	48 c7 02 08 00 00 00 	movq   $0x8,(%rdx)
    1b98:	48 c7 42 08 71 00 00 	movq   $0x71,0x8(%rdx)
    1b9f:	00 
    1ba0:	4c 89 e1             	mov    %r12,%rcx
    1ba3:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
    1ba7:	48 c7 42 18 00 00 00 	movq   $0x0,0x18(%rdx)
    1bae:	00 
    1baf:	48 89 f9             	mov    %rdi,%rcx
    1bb2:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
    1bb6:	48 c7 42 28 00 00 00 	movq   $0x0,0x28(%rdx)
    1bbd:	00 
    1bbe:	ff 32                	pushq  (%rdx)
    1bc0:	48 8b 15 89 15 20 00 	mov    0x201589(%rip),%rdx        # 203150 <tmpquadone>
    1bc7:	48 8b 0d ba 15 20 00 	mov    0x2015ba(%rip),%rcx        # 203188 <tmpquadtwo>
    1bce:	48 c7 05 8f 15 20 00 	movq   $0x1,0x20158f(%rip)        # 203168 <cmpPassed>
    1bd5:	01 00 00 00 
    1bd9:	e8 b2 02 00 00       	callq  1e90 <_storeDataFn>
    1bde:	4c 39 e7             	cmp    %r12,%rdi
    1be1:	74 1d                	je     1c00 <runSUT+0x8f2>
    1be3:	50                   	push   %rax
    1be4:	48 b8 93 32 02 e7 00 	movabs $0xe7023293,%rax
    1beb:	00 00 00 
    1bee:	48 89 05 4b 15 20 00 	mov    %rax,0x20154b(%rip)        # 203140 <edgeId>
    1bf5:	58                   	pop    %rax
    1bf6:	e8 23 02 00 00       	callq  1e1e <_storeEdge>
    1bfb:	e8 90 f5 ff ff       	callq  1190 <_ZdlPv@plt>
    1c00:	50                   	push   %rax
    1c01:	48 b8 19 81 73 a3 00 	movabs $0xa3738119,%rax
    1c08:	00 00 00 
    1c0b:	48 89 05 2e 15 20 00 	mov    %rax,0x20152e(%rip)        # 203140 <edgeId>
    1c12:	58                   	pop    %rax
    1c13:	e8 06 02 00 00       	callq  1e1e <_storeEdge>
      { return _M_data() == _M_local_data(); }
    1c18:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
	if (!_M_is_local())
    1c1d:	48 83 c5 10          	add    $0x10,%rbp
    1c21:	48 89 15 28 15 20 00 	mov    %rdx,0x201528(%rip)        # 203150 <tmpquadone>
    1c28:	48 89 0d 59 15 20 00 	mov    %rcx,0x201559(%rip)        # 203188 <tmpquadtwo>
    1c2f:	48 8d 15 6a 15 20 00 	lea    0x20156a(%rip),%rdx        # 2031a0 <funcinptr>
    1c36:	48 c7 02 09 00 00 00 	movq   $0x9,(%rdx)
    1c3d:	48 c7 42 08 71 00 00 	movq   $0x71,0x8(%rdx)
    1c44:	00 
    1c45:	48 89 e9             	mov    %rbp,%rcx
    1c48:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
    1c4c:	48 c7 42 18 00 00 00 	movq   $0x0,0x18(%rdx)
    1c53:	00 
    1c54:	48 89 f9             	mov    %rdi,%rcx
    1c57:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
    1c5b:	48 c7 42 28 00 00 00 	movq   $0x0,0x28(%rdx)
    1c62:	00 
    1c63:	ff 32                	pushq  (%rdx)
    1c65:	48 8b 15 e4 14 20 00 	mov    0x2014e4(%rip),%rdx        # 203150 <tmpquadone>
    1c6c:	48 8b 0d 15 15 20 00 	mov    0x201515(%rip),%rcx        # 203188 <tmpquadtwo>
    1c73:	48 c7 05 ea 14 20 00 	movq   $0x1,0x2014ea(%rip)        # 203168 <cmpPassed>
    1c7a:	01 00 00 00 
    1c7e:	e8 0d 02 00 00       	callq  1e90 <_storeDataFn>
    1c83:	48 39 ef             	cmp    %rbp,%rdi
    1c86:	74 1d                	je     1ca5 <runSUT+0x997>
    1c88:	50                   	push   %rax
    1c89:	48 b8 a3 83 ec 95 00 	movabs $0x95ec83a3,%rax
    1c90:	00 00 00 
    1c93:	48 89 05 a6 14 20 00 	mov    %rax,0x2014a6(%rip)        # 203140 <edgeId>
    1c9a:	58                   	pop    %rax
    1c9b:	e8 7e 01 00 00       	callq  1e1e <_storeEdge>
    1ca0:	e8 eb f4 ff ff       	callq  1190 <_ZdlPv@plt>
    1ca5:	50                   	push   %rax
    1ca6:	48 b8 41 f6 4a b3 00 	movabs $0xb34af641,%rax
    1cad:	00 00 00 
    1cb0:	48 89 05 89 14 20 00 	mov    %rax,0x201489(%rip)        # 203140 <edgeId>
    1cb7:	58                   	pop    %rax
    1cb8:	e8 61 01 00 00       	callq  1e1e <_storeEdge>
  istringstream iss(line);
    1cbd:	4c 89 f7             	mov    %r14,%rdi
    1cc0:	e8 7b f4 ff ff       	callq  1140 <_ZNSt7__cxx1119basic_istringstreamIcSt11char_traitsIcESaIcEED1Ev@plt>
    1cc5:	50                   	push   %rax
    1cc6:	48 b8 57 9a 0d a6 00 	movabs $0xa60d9a57,%rax
    1ccd:	00 00 00 
    1cd0:	48 89 05 69 14 20 00 	mov    %rax,0x201469(%rip)        # 203140 <edgeId>
    1cd7:	58                   	pop    %rax
    1cd8:	e8 41 01 00 00       	callq  1e1e <_storeEdge>
      { return _M_data() == _M_local_data(); }
    1cdd:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
	if (!_M_is_local())
    1ce2:	48 83 c3 10          	add    $0x10,%rbx
    1ce6:	48 89 15 63 14 20 00 	mov    %rdx,0x201463(%rip)        # 203150 <tmpquadone>
    1ced:	48 89 0d 94 14 20 00 	mov    %rcx,0x201494(%rip)        # 203188 <tmpquadtwo>
    1cf4:	48 8d 15 a5 14 20 00 	lea    0x2014a5(%rip),%rdx        # 2031a0 <funcinptr>
    1cfb:	48 c7 02 0a 00 00 00 	movq   $0xa,(%rdx)
    1d02:	48 c7 42 08 71 00 00 	movq   $0x71,0x8(%rdx)
    1d09:	00 
    1d0a:	48 89 d9             	mov    %rbx,%rcx
    1d0d:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
    1d11:	48 c7 42 18 00 00 00 	movq   $0x0,0x18(%rdx)
    1d18:	00 
    1d19:	48 89 f9             	mov    %rdi,%rcx
    1d1c:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
    1d20:	48 c7 42 28 00 00 00 	movq   $0x0,0x28(%rdx)
    1d27:	00 
    1d28:	ff 32                	pushq  (%rdx)
    1d2a:	48 8b 15 1f 14 20 00 	mov    0x20141f(%rip),%rdx        # 203150 <tmpquadone>
    1d31:	48 8b 0d 50 14 20 00 	mov    0x201450(%rip),%rcx        # 203188 <tmpquadtwo>
    1d38:	48 c7 05 25 14 20 00 	movq   $0x1,0x201425(%rip)        # 203168 <cmpPassed>
    1d3f:	01 00 00 00 
    1d43:	e8 48 01 00 00       	callq  1e90 <_storeDataFn>
    1d48:	48 39 df             	cmp    %rbx,%rdi
    1d4b:	74 1a                	je     1d67 <runSUT+0xa59>
    1d4d:	50                   	push   %rax
    1d4e:	48 c7 c0 0d a6 6b 18 	mov    $0x186ba60d,%rax
    1d55:	48 89 05 e4 13 20 00 	mov    %rax,0x2013e4(%rip)        # 203140 <edgeId>
    1d5c:	58                   	pop    %rax
    1d5d:	e8 bc 00 00 00       	callq  1e1e <_storeEdge>
    1d62:	e8 29 f4 ff ff       	callq  1190 <_ZdlPv@plt>
    1d67:	50                   	push   %rax
    1d68:	48 b8 d3 35 8c a0 00 	movabs $0xa08c35d3,%rax
    1d6f:	00 00 00 
    1d72:	48 89 05 c7 13 20 00 	mov    %rax,0x2013c7(%rip)        # 203140 <edgeId>
    1d79:	58                   	pop    %rax
    1d7a:	e8 9f 00 00 00       	callq  1e1e <_storeEdge>
  ifstream t(path);
    1d7f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    1d84:	e8 87 f3 ff ff       	callq  1110 <_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev@plt>
    1d89:	e9 62 fd ff ff       	jmpq   1af0 <runSUT+0x7e2>
    1d8e:	50                   	push   %rax
    1d8f:	48 b8 18 41 17 e9 00 	movabs $0xe9174118,%rax
    1d96:	00 00 00 
    1d99:	48 89 05 a0 13 20 00 	mov    %rax,0x2013a0(%rip)        # 203140 <edgeId>
    1da0:	58                   	pop    %rax
    1da1:	e8 78 00 00 00       	callq  1e1e <_storeEdge>
    1da6:	49 89 c7             	mov    %rax,%r15
    1da9:	e9 91 fd ff ff       	jmpq   1b3f <runSUT+0x831>
    1dae:	50                   	push   %rax
    1daf:	48 b8 23 e8 22 bd 00 	movabs $0xbd22e823,%rax
    1db6:	00 00 00 
    1db9:	48 89 05 80 13 20 00 	mov    %rax,0x201380(%rip)        # 203140 <edgeId>
    1dc0:	58                   	pop    %rax
    1dc1:	e8 58 00 00 00       	callq  1e1e <_storeEdge>
    1dc6:	49 89 c7             	mov    %rax,%r15
    1dc9:	e9 90 fd ff ff       	jmpq   1b5e <runSUT+0x850>
    1dce:	50                   	push   %rax
    1dcf:	48 c7 c0 82 2e d2 5b 	mov    $0x5bd22e82,%rax
    1dd6:	48 89 05 63 13 20 00 	mov    %rax,0x201363(%rip)        # 203140 <edgeId>
    1ddd:	58                   	pop    %rax
    1dde:	e8 3b 00 00 00       	callq  1e1e <_storeEdge>
    1de3:	49 89 c7             	mov    %rax,%r15
    1de6:	e9 da fe ff ff       	jmpq   1cc5 <runSUT+0x9b7>
    1deb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001df0 <_GLOBAL__sub_I_main>:
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  //@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
    1df0:	48 8d 3d 3d 13 20 00 	lea    0x20133d(%rip),%rdi        # 203134 <_ZStL8__ioinit>
}
    1df7:	48 83 ec 08          	sub    $0x8,%rsp
    1dfb:	e8 30 f4 ff ff       	callq  1230 <_ZNSt8ios_base4InitC1Ev@plt>
    1e00:	48 8b 3d f1 11 20 00 	mov    0x2011f1(%rip),%rdi        # 202ff8 <_ZNSt8ios_base4InitD1Ev@GLIBCXX_3.4>
    1e07:	48 8d 15 fa 11 20 00 	lea    0x2011fa(%rip),%rdx        # 203008 <__dso_handle>
    1e0e:	48 8d 35 1f 13 20 00 	lea    0x20131f(%rip),%rsi        # 203134 <_ZStL8__ioinit>
    1e15:	48 83 c4 08          	add    $0x8,%rsp
    1e19:	e9 62 f3 ff ff       	jmpq   1180 <__cxa_atexit@plt>

0000000000001e1e <_storeEdge>:
    1e1e:	48 83 3d 42 13 20 00 	cmpq   $0x1,0x201342(%rip)        # 203168 <cmpPassed>
    1e25:	01 
    1e26:	75 63                	jne    1e8b <_moveon>
    1e28:	48 83 3d 48 13 20 00 	cmpq   $0x1,0x201348(%rip)        # 203178 <instswitch>
    1e2f:	01 
    1e30:	75 59                	jne    1e8b <_moveon>
    1e32:	48 c7 05 2b 13 20 00 	movq   $0x0,0x20132b(%rip)        # 203168 <cmpPassed>
    1e39:	00 00 00 00 
    1e3d:	50                   	push   %rax
    1e3e:	48 8b 05 03 13 20 00 	mov    0x201303(%rip),%rax        # 203148 <shmptr2Cnt>
    1e45:	48 c1 e0 03          	shl    $0x3,%rax
    1e49:	48 3b 05 40 13 20 00 	cmp    0x201340(%rip),%rax        # 203190 <shmSize2>
    1e50:	77 25                	ja     1e77 <_shm2Full>
    1e52:	53                   	push   %rbx
    1e53:	51                   	push   %rcx
    1e54:	52                   	push   %rdx
    1e55:	48 8b 1d e4 12 20 00 	mov    0x2012e4(%rip),%rbx        # 203140 <edgeId>
    1e5c:	48 8b 15 0d 13 20 00 	mov    0x20130d(%rip),%rdx        # 203170 <shmptr_edge>
    1e63:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
    1e67:	48 89 19             	mov    %rbx,(%rcx)
    1e6a:	5a                   	pop    %rdx
    1e6b:	59                   	pop    %rcx
    1e6c:	5b                   	pop    %rbx
    1e6d:	58                   	pop    %rax
    1e6e:	48 83 05 d2 12 20 00 	addq   $0x1,0x2012d2(%rip)        # 203148 <shmptr2Cnt>
    1e75:	01 
    1e76:	c3                   	retq   

0000000000001e77 <_shm2Full>:
    1e77:	48 8d 3d cf 04 00 00 	lea    0x4cf(%rip),%rdi        # 234d <.shmFullWarning>
    1e7e:	48 31 c0             	xor    %rax,%rax
    1e81:	e8 5a f2 ff ff       	callq  10e0 <printf@plt>
    1e86:	e8 d5 f3 ff ff       	callq  1260 <_exit@plt>

0000000000001e8b <_moveon>:
    1e8b:	c3                   	retq   
    1e8c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001e90 <_storeDataFn>:
    1e90:	55                   	push   %rbp
    1e91:	48 89 e5             	mov    %rsp,%rbp
    1e94:	50                   	push   %rax
    1e95:	53                   	push   %rbx
    1e96:	41 50                	push   %r8
    1e98:	41 51                	push   %r9
    1e9a:	41 52                	push   %r10
    1e9c:	48 83 3d d4 12 20 00 	cmpq   $0x1,0x2012d4(%rip)        # 203178 <instswitch>
    1ea3:	01 
    1ea4:	75 67                	jne    1f0d <_skipstoredata>
    1ea6:	48 8b 05 ab 12 20 00 	mov    0x2012ab(%rip),%rax        # 203158 <shmptr_gcnt>
    1ead:	48 8b 00             	mov    (%rax),%rax
    1eb0:	48 c1 e0 03          	shl    $0x3,%rax
    1eb4:	48 39 05 a5 12 20 00 	cmp    %rax,0x2012a5(%rip)        # 203160 <shmSize>
    1ebb:	74 5f                	je     1f1c <_shmFull>
    1ebd:	48 83 3d bb 12 20 00 	cmpq   $0x0,0x2012bb(%rip)        # 203180 <shmptr_cmp>
    1ec4:	00 
    1ec5:	74 69                	je     1f30 <_shmUninitialize>
    1ec7:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx
    1ece:	48 c1 e8 03          	shr    $0x3,%rax

0000000000001ed2 <_storeloop>:
    1ed2:	49 89 c2             	mov    %rax,%r10
    1ed5:	49 c1 e2 03          	shl    $0x3,%r10
    1ed9:	4c 03 15 a0 12 20 00 	add    0x2012a0(%rip),%r10        # 203180 <shmptr_cmp>
    1ee0:	49 89 d9             	mov    %rbx,%r9
    1ee3:	49 c1 e1 03          	shl    $0x3,%r9
    1ee7:	4c 8d 05 b2 12 20 00 	lea    0x2012b2(%rip),%r8        # 2031a0 <funcinptr>
    1eee:	4d 01 c1             	add    %r8,%r9
    1ef1:	4d 8b 01             	mov    (%r9),%r8
    1ef4:	4d 89 02             	mov    %r8,(%r10)
    1ef7:	48 ff c0             	inc    %rax
    1efa:	48 ff c3             	inc    %rbx
    1efd:	48 83 fb 06          	cmp    $0x6,%rbx
    1f01:	75 cf                	jne    1ed2 <_storeloop>
    1f03:	48 8b 1d 4e 12 20 00 	mov    0x20124e(%rip),%rbx        # 203158 <shmptr_gcnt>
    1f0a:	48 89 03             	mov    %rax,(%rbx)

0000000000001f0d <_skipstoredata>:
    1f0d:	41 5a                	pop    %r10
    1f0f:	41 59                	pop    %r9
    1f11:	41 58                	pop    %r8
    1f13:	5b                   	pop    %rbx
    1f14:	58                   	pop    %rax
    1f15:	48 89 ec             	mov    %rbp,%rsp
    1f18:	5d                   	pop    %rbp
    1f19:	c2 08 00             	retq   $0x8

0000000000001f1c <_shmFull>:
    1f1c:	48 8d 3d 2a 04 00 00 	lea    0x42a(%rip),%rdi        # 234d <.shmFullWarning>
    1f23:	48 31 c0             	xor    %rax,%rax
    1f26:	e8 b5 f1 ff ff       	callq  10e0 <printf@plt>
    1f2b:	e8 30 f3 ff ff       	callq  1260 <_exit@plt>

0000000000001f30 <_shmUninitialize>:
    1f30:	48 89 ec             	mov    %rbp,%rsp
    1f33:	5d                   	pop    %rbp
    1f34:	48 31 c0             	xor    %rax,%rax
    1f37:	c2 08 00             	retq   $0x8
    1f3a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1f40:	9f                   	lahf   
    1f41:	0f 90 c0             	seto   %al
    1f44:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001f48 <__afl_setup_first>:
    1f48:	48 8d a4 24 a0 fe ff 	lea    -0x160(%rsp),%rsp
    1f4f:	ff 
    1f50:	48 89 04 24          	mov    %rax,(%rsp)
    1f54:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    1f59:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
    1f5e:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
    1f63:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
    1f68:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
    1f6d:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
    1f72:	4c 89 5c 24 40       	mov    %r11,0x40(%rsp)
    1f77:	66 0f d6 44 24 60    	movq   %xmm0,0x60(%rsp)
    1f7d:	66 0f d6 4c 24 70    	movq   %xmm1,0x70(%rsp)
    1f83:	66 0f d6 94 24 80 00 	movq   %xmm2,0x80(%rsp)
    1f8a:	00 00 
    1f8c:	66 0f d6 9c 24 90 00 	movq   %xmm3,0x90(%rsp)
    1f93:	00 00 
    1f95:	66 0f d6 a4 24 a0 00 	movq   %xmm4,0xa0(%rsp)
    1f9c:	00 00 
    1f9e:	66 0f d6 ac 24 b0 00 	movq   %xmm5,0xb0(%rsp)
    1fa5:	00 00 
    1fa7:	66 0f d6 b4 24 c0 00 	movq   %xmm6,0xc0(%rsp)
    1fae:	00 00 
    1fb0:	66 0f d6 bc 24 d0 00 	movq   %xmm7,0xd0(%rsp)
    1fb7:	00 00 
    1fb9:	66 44 0f d6 84 24 e0 	movq   %xmm8,0xe0(%rsp)
    1fc0:	00 00 00 
    1fc3:	66 44 0f d6 8c 24 f0 	movq   %xmm9,0xf0(%rsp)
    1fca:	00 00 00 
    1fcd:	66 44 0f d6 94 24 00 	movq   %xmm10,0x100(%rsp)
    1fd4:	01 00 00 
    1fd7:	66 44 0f d6 9c 24 10 	movq   %xmm11,0x110(%rsp)
    1fde:	01 00 00 
    1fe1:	66 44 0f d6 a4 24 20 	movq   %xmm12,0x120(%rsp)
    1fe8:	01 00 00 
    1feb:	66 44 0f d6 ac 24 30 	movq   %xmm13,0x130(%rsp)
    1ff2:	01 00 00 
    1ff5:	66 44 0f d6 b4 24 40 	movq   %xmm14,0x140(%rsp)
    1ffc:	01 00 00 
    1fff:	66 44 0f d6 bc 24 50 	movq   %xmm15,0x150(%rsp)
    2006:	01 00 00 
    2009:	41 54                	push   %r12
    200b:	49 89 e4             	mov    %rsp,%r12
    200e:	48 83 ec 10          	sub    $0x10,%rsp
    2012:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    2016:	48 8d 3d 46 03 00 00 	lea    0x346(%rip),%rdi        # 2363 <.SHM_ENV_CMP>
    201d:	e8 be f1 ff ff       	callq  11e0 <getenv@plt>
    2022:	48 85 c0             	test   %rax,%rax
    2025:	0f 84 25 01 00 00    	je     2150 <__afl_setup_abort>
    202b:	48 89 c7             	mov    %rax,%rdi
    202e:	e8 1d f2 ff ff       	callq  1250 <atoi@plt>
    2033:	48 31 d2             	xor    %rdx,%rdx
    2036:	48 31 f6             	xor    %rsi,%rsi
    2039:	48 89 c7             	mov    %rax,%rdi
    203c:	e8 af f1 ff ff       	callq  11f0 <shmat@plt>
    2041:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    2045:	0f 84 05 01 00 00    	je     2150 <__afl_setup_abort>
    204b:	48 89 c2             	mov    %rax,%rdx
    204e:	48 89 05 2b 11 20 00 	mov    %rax,0x20112b(%rip)        # 203180 <shmptr_cmp>
    2055:	48 8d 3d 13 03 00 00 	lea    0x313(%rip),%rdi        # 236f <.SHM_ENV_EDGE>
    205c:	e8 7f f1 ff ff       	callq  11e0 <getenv@plt>
    2061:	48 85 c0             	test   %rax,%rax
    2064:	0f 84 e6 00 00 00    	je     2150 <__afl_setup_abort>
    206a:	48 89 c7             	mov    %rax,%rdi
    206d:	e8 de f1 ff ff       	callq  1250 <atoi@plt>
    2072:	48 31 d2             	xor    %rdx,%rdx
    2075:	48 31 f6             	xor    %rsi,%rsi
    2078:	48 89 c7             	mov    %rax,%rdi
    207b:	e8 70 f1 ff ff       	callq  11f0 <shmat@plt>
    2080:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    2084:	0f 84 c6 00 00 00    	je     2150 <__afl_setup_abort>
    208a:	48 89 c2             	mov    %rax,%rdx
    208d:	48 89 05 dc 10 20 00 	mov    %rax,0x2010dc(%rip)        # 203170 <shmptr_edge>

0000000000002094 <__afl_forkserver>:
    2094:	48 c7 c2 04 00 00 00 	mov    $0x4,%rdx
    209b:	48 8d 35 9a 10 20 00 	lea    0x20109a(%rip),%rsi        # 20313c <__afl_temp>
    20a2:	48 c7 c7 c7 00 00 00 	mov    $0xc7,%rdi
    20a9:	e8 82 f0 ff ff       	callq  1130 <write@plt>
    20ae:	48 83 f8 04          	cmp    $0x4,%rax
    20b2:	0f 85 61 01 00 00    	jne    2219 <__afl_fork_resume>

00000000000020b8 <__afl_fork_wait_loop>:
    20b8:	48 c7 c2 04 00 00 00 	mov    $0x4,%rdx
    20bf:	48 8d 35 76 10 20 00 	lea    0x201076(%rip),%rsi        # 20313c <__afl_temp>
    20c6:	48 c7 c7 c6 00 00 00 	mov    $0xc6,%rdi
    20cd:	e8 3e f1 ff ff       	callq  1210 <read@plt>
    20d2:	48 83 f8 04          	cmp    $0x4,%rax
    20d6:	75 70                	jne    2148 <__afl_die>
    20d8:	e8 43 f0 ff ff       	callq  1120 <fork@plt>
    20dd:	48 83 f8 00          	cmp    $0x0,%rax
    20e1:	7c 65                	jl     2148 <__afl_die>
    20e3:	0f 84 30 01 00 00    	je     2219 <__afl_fork_resume>
    20e9:	89 05 49 10 20 00    	mov    %eax,0x201049(%rip)        # 203138 <__afl_fork_pid>
    20ef:	48 c7 c2 04 00 00 00 	mov    $0x4,%rdx
    20f6:	48 8d 35 3b 10 20 00 	lea    0x20103b(%rip),%rsi        # 203138 <__afl_fork_pid>
    20fd:	48 c7 c7 c7 00 00 00 	mov    $0xc7,%rdi
    2104:	e8 27 f0 ff ff       	callq  1130 <write@plt>
    2109:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
    2110:	48 8d 35 25 10 20 00 	lea    0x201025(%rip),%rsi        # 20313c <__afl_temp>
    2117:	48 8b 3d 1a 10 20 00 	mov    0x20101a(%rip),%rdi        # 203138 <__afl_fork_pid>
    211e:	e8 4d f0 ff ff       	callq  1170 <waitpid@plt>
    2123:	48 83 f8 00          	cmp    $0x0,%rax
    2127:	7e 1f                	jle    2148 <__afl_die>
    2129:	48 c7 c2 04 00 00 00 	mov    $0x4,%rdx
    2130:	48 8d 35 05 10 20 00 	lea    0x201005(%rip),%rsi        # 20313c <__afl_temp>
    2137:	48 c7 c7 c7 00 00 00 	mov    $0xc7,%rdi
    213e:	e8 ed ef ff ff       	callq  1130 <write@plt>
    2143:	e9 70 ff ff ff       	jmpq   20b8 <__afl_fork_wait_loop>

0000000000002148 <__afl_die>:
    2148:	48 31 c0             	xor    %rax,%rax
    214b:	e8 10 f1 ff ff       	callq  1260 <_exit@plt>

0000000000002150 <__afl_setup_abort>:
    2150:	4c 89 e4             	mov    %r12,%rsp
    2153:	41 5c                	pop    %r12
    2155:	48 8b 04 24          	mov    (%rsp),%rax
    2159:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    215e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    2163:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    2168:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    216d:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    2172:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
    2177:	4c 8b 5c 24 40       	mov    0x40(%rsp),%r11
    217c:	f3 0f 7e 44 24 60    	movq   0x60(%rsp),%xmm0
    2182:	f3 0f 7e 4c 24 70    	movq   0x70(%rsp),%xmm1
    2188:	f3 0f 7e 94 24 80 00 	movq   0x80(%rsp),%xmm2
    218f:	00 00 
    2191:	f3 0f 7e 9c 24 90 00 	movq   0x90(%rsp),%xmm3
    2198:	00 00 
    219a:	f3 0f 7e a4 24 a0 00 	movq   0xa0(%rsp),%xmm4
    21a1:	00 00 
    21a3:	f3 0f 7e ac 24 b0 00 	movq   0xb0(%rsp),%xmm5
    21aa:	00 00 
    21ac:	f3 0f 7e b4 24 c0 00 	movq   0xc0(%rsp),%xmm6
    21b3:	00 00 
    21b5:	f3 0f 7e bc 24 d0 00 	movq   0xd0(%rsp),%xmm7
    21bc:	00 00 
    21be:	f3 44 0f 7e 84 24 e0 	movq   0xe0(%rsp),%xmm8
    21c5:	00 00 00 
    21c8:	f3 44 0f 7e 8c 24 f0 	movq   0xf0(%rsp),%xmm9
    21cf:	00 00 00 
    21d2:	f3 44 0f 7e 94 24 00 	movq   0x100(%rsp),%xmm10
    21d9:	01 00 00 
    21dc:	f3 44 0f 7e 9c 24 10 	movq   0x110(%rsp),%xmm11
    21e3:	01 00 00 
    21e6:	f3 44 0f 7e a4 24 20 	movq   0x120(%rsp),%xmm12
    21ed:	01 00 00 
    21f0:	f3 44 0f 7e ac 24 30 	movq   0x130(%rsp),%xmm13
    21f7:	01 00 00 
    21fa:	f3 44 0f 7e b4 24 40 	movq   0x140(%rsp),%xmm14
    2201:	01 00 00 
    2204:	f3 44 0f 7e bc 24 50 	movq   0x150(%rsp),%xmm15
    220b:	01 00 00 
    220e:	48 8d a4 24 60 01 00 	lea    0x160(%rsp),%rsp
    2215:	00 
    2216:	b0 7f                	mov    $0x7f,%al
    2218:	c3                   	retq   

0000000000002219 <__afl_fork_resume>:
    2219:	48 c7 05 3c 0f 20 00 	movq   $0x10000,0x200f3c(%rip)        # 203160 <shmSize>
    2220:	00 00 01 00 
    2224:	48 c7 05 61 0f 20 00 	movq   $0x10000,0x200f61(%rip)        # 203190 <shmSize2>
    222b:	00 00 01 00 
    222f:	48 c7 c7 c6 00 00 00 	mov    $0xc6,%rdi
    2236:	e8 85 f0 ff ff       	callq  12c0 <close@plt>
    223b:	48 c7 c7 c7 00 00 00 	mov    $0xc7,%rdi
    2242:	e8 79 f0 ff ff       	callq  12c0 <close@plt>
    2247:	48 8d 3d 2e 01 00 00 	lea    0x12e(%rip),%rdi        # 237c <.SHM_ENV_GCNT>
    224e:	e8 8d ef ff ff       	callq  11e0 <getenv@plt>
    2253:	48 85 c0             	test   %rax,%rax
    2256:	0f 84 ec fe ff ff    	je     2148 <__afl_die>
    225c:	48 89 c7             	mov    %rax,%rdi
    225f:	e8 ec ef ff ff       	callq  1250 <atoi@plt>
    2264:	48 31 d2             	xor    %rdx,%rdx
    2267:	48 31 f6             	xor    %rsi,%rsi
    226a:	48 89 c7             	mov    %rax,%rdi
    226d:	e8 7e ef ff ff       	callq  11f0 <shmat@plt>
    2272:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
    2276:	0f 84 cc fe ff ff    	je     2148 <__afl_die>
    227c:	48 89 c2             	mov    %rax,%rdx
    227f:	48 89 05 d2 0e 20 00 	mov    %rax,0x200ed2(%rip)        # 203158 <shmptr_gcnt>
    2286:	4c 89 e4             	mov    %r12,%rsp
    2289:	41 5c                	pop    %r12
    228b:	48 8b 04 24          	mov    (%rsp),%rax
    228f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    2294:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    2299:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    229e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
    22a3:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
    22a8:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
    22ad:	4c 8b 5c 24 40       	mov    0x40(%rsp),%r11
    22b2:	f3 0f 7e 44 24 60    	movq   0x60(%rsp),%xmm0
    22b8:	f3 0f 7e 4c 24 70    	movq   0x70(%rsp),%xmm1
    22be:	f3 0f 7e 94 24 80 00 	movq   0x80(%rsp),%xmm2
    22c5:	00 00 
    22c7:	f3 0f 7e 9c 24 90 00 	movq   0x90(%rsp),%xmm3
    22ce:	00 00 
    22d0:	f3 0f 7e a4 24 a0 00 	movq   0xa0(%rsp),%xmm4
    22d7:	00 00 
    22d9:	f3 0f 7e ac 24 b0 00 	movq   0xb0(%rsp),%xmm5
    22e0:	00 00 
    22e2:	f3 0f 7e b4 24 c0 00 	movq   0xc0(%rsp),%xmm6
    22e9:	00 00 
    22eb:	f3 0f 7e bc 24 d0 00 	movq   0xd0(%rsp),%xmm7
    22f2:	00 00 
    22f4:	f3 44 0f 7e 84 24 e0 	movq   0xe0(%rsp),%xmm8
    22fb:	00 00 00 
    22fe:	f3 44 0f 7e 8c 24 f0 	movq   0xf0(%rsp),%xmm9
    2305:	00 00 00 
    2308:	f3 44 0f 7e 94 24 00 	movq   0x100(%rsp),%xmm10
    230f:	01 00 00 
    2312:	f3 44 0f 7e 9c 24 10 	movq   0x110(%rsp),%xmm11
    2319:	01 00 00 
    231c:	f3 44 0f 7e a4 24 20 	movq   0x120(%rsp),%xmm12
    2323:	01 00 00 
    2326:	f3 44 0f 7e ac 24 30 	movq   0x130(%rsp),%xmm13
    232d:	01 00 00 
    2330:	f3 44 0f 7e b4 24 40 	movq   0x140(%rsp),%xmm14
    2337:	01 00 00 
    233a:	f3 44 0f 7e bc 24 50 	movq   0x150(%rsp),%xmm15
    2341:	01 00 00 
    2344:	48 8d a4 24 60 01 00 	lea    0x160(%rsp),%rsp
    234b:	00 
    234c:	c3                   	retq   

000000000000234d <.shmFullWarning>:
    234d:	73 68                	jae    23b7 <_start+0x7>
    234f:	6d                   	insl   (%dx),%es:(%rdi)
    2350:	46 75 6c             	rex.RX jne 23bf <_start+0xf>
    2353:	6c                   	insb   (%dx),%es:(%rdi)
    2354:	2c 20                	sub    $0x20,%al
    2356:	70 72                	jo     23ca <_start+0x1a>
    2358:	6f                   	outsl  %ds:(%rsi),(%dx)
    2359:	67 72 61             	addr32 jb 23bd <_start+0xd>
    235c:	6d                   	insl   (%dx),%es:(%rdi)
    235d:	20 65 78             	and    %ah,0x78(%rbp)
    2360:	69                   	.byte 0x69
    2361:	74 00                	je     2363 <.SHM_ENV_CMP>

0000000000002363 <.SHM_ENV_CMP>:
    2363:	53                   	push   %rbx
    2364:	48                   	rex.W
    2365:	4d 5f                	rex.WRB pop %r15
    2367:	45                   	rex.RB
    2368:	4e 56                	rex.WRX push %rsi
    236a:	5f                   	pop    %rdi
    236b:	43                   	rex.XB
    236c:	4d 50                	rex.WRB push %r8
	...

000000000000236f <.SHM_ENV_EDGE>:
    236f:	53                   	push   %rbx
    2370:	48                   	rex.W
    2371:	4d 5f                	rex.WRB pop %r15
    2373:	45                   	rex.RB
    2374:	4e 56                	rex.WRX push %rsi
    2376:	5f                   	pop    %rdi
    2377:	45                   	rex.RB
    2378:	44                   	rex.R
    2379:	47                   	rex.RXB
    237a:	45                   	rex.RB
	...

000000000000237c <.SHM_ENV_GCNT>:
    237c:	53                   	push   %rbx
    237d:	48                   	rex.W
    237e:	4d 5f                	rex.WRB pop %r15
    2380:	45                   	rex.RB
    2381:	4e 56                	rex.WRX push %rsi
    2383:	5f                   	pop    %rdi
    2384:	47                   	rex.RXB
    2385:	43                   	rex.XB
    2386:	4e 54                	rex.WRX push %rsp
	...

0000000000002389 <.serverSetupError>:
    2389:	20 53 65             	and    %dl,0x65(%rbx)
    238c:	72 76                	jb     2404 <deregister_tm_clones+0x24>
    238e:	65 72 20             	gs jb  23b1 <_start+0x1>
    2391:	53                   	push   %rbx
    2392:	65 74 75             	gs je  240a <deregister_tm_clones+0x2a>
    2395:	70 20                	jo     23b7 <_start+0x7>
    2397:	45 72 72             	rex.RB jb 240c <deregister_tm_clones+0x2c>
    239a:	6f                   	outsl  %ds:(%rsi),(%dx)
    239b:	72 2c                	jb     23c9 <_start+0x19>
    239d:	20 61 62             	and    %ah,0x62(%rcx)
    23a0:	6f                   	outsl  %ds:(%rsi),(%dx)
    23a1:	72 74                	jb     2417 <deregister_tm_clones+0x37>
    23a3:	20 6e 6f             	and    %ch,0x6f(%rsi)
    23a6:	77 00                	ja     23a8 <.serverSetupError+0x1f>
    23a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    23af:	00 

00000000000023b0 <_start>:
    23b0:	31 ed                	xor    %ebp,%ebp
    23b2:	49 89 d1             	mov    %rdx,%r9
    23b5:	5e                   	pop    %rsi
    23b6:	48 89 e2             	mov    %rsp,%rdx
    23b9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    23bd:	50                   	push   %rax
    23be:	54                   	push   %rsp
    23bf:	4c 8d 05 6a 01 00 00 	lea    0x16a(%rip),%r8        # 2530 <__libc_csu_fini>
    23c6:	48 8d 0d f3 00 00 00 	lea    0xf3(%rip),%rcx        # 24c0 <__libc_csu_init>
    23cd:	48 8d 3d 0c ef ff ff 	lea    -0x10f4(%rip),%rdi        # 12e0 <main>
    23d4:	ff 15 06 0c 20 00    	callq  *0x200c06(%rip)        # 202fe0 <__libc_start_main@GLIBC_2.2.5>
    23da:	f4                   	hlt    
    23db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000023e0 <deregister_tm_clones>:
    23e0:	48 8d 3d 31 0c 20 00 	lea    0x200c31(%rip),%rdi        # 203018 <__TMC_END__>
    23e7:	55                   	push   %rbp
    23e8:	48 8d 05 29 0c 20 00 	lea    0x200c29(%rip),%rax        # 203018 <__TMC_END__>
    23ef:	48 39 f8             	cmp    %rdi,%rax
    23f2:	48 89 e5             	mov    %rsp,%rbp
    23f5:	74 19                	je     2410 <deregister_tm_clones+0x30>
    23f7:	48 8b 05 da 0b 20 00 	mov    0x200bda(%rip),%rax        # 202fd8 <_ITM_deregisterTMCloneTable>
    23fe:	48 85 c0             	test   %rax,%rax
    2401:	74 0d                	je     2410 <deregister_tm_clones+0x30>
    2403:	5d                   	pop    %rbp
    2404:	ff e0                	jmpq   *%rax
    2406:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    240d:	00 00 00 
    2410:	5d                   	pop    %rbp
    2411:	c3                   	retq   
    2412:	0f 1f 40 00          	nopl   0x0(%rax)
    2416:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    241d:	00 00 00 

0000000000002420 <register_tm_clones>:
    2420:	48 8d 3d f1 0b 20 00 	lea    0x200bf1(%rip),%rdi        # 203018 <__TMC_END__>
    2427:	48 8d 35 ea 0b 20 00 	lea    0x200bea(%rip),%rsi        # 203018 <__TMC_END__>
    242e:	55                   	push   %rbp
    242f:	48 29 fe             	sub    %rdi,%rsi
    2432:	48 89 e5             	mov    %rsp,%rbp
    2435:	48 c1 fe 03          	sar    $0x3,%rsi
    2439:	48 89 f0             	mov    %rsi,%rax
    243c:	48 c1 e8 3f          	shr    $0x3f,%rax
    2440:	48 01 c6             	add    %rax,%rsi
    2443:	48 d1 fe             	sar    %rsi
    2446:	74 18                	je     2460 <register_tm_clones+0x40>
    2448:	48 8b 05 a1 0b 20 00 	mov    0x200ba1(%rip),%rax        # 202ff0 <_ITM_registerTMCloneTable>
    244f:	48 85 c0             	test   %rax,%rax
    2452:	74 0c                	je     2460 <register_tm_clones+0x40>
    2454:	5d                   	pop    %rbp
    2455:	ff e0                	jmpq   *%rax
    2457:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    245e:	00 00 
    2460:	5d                   	pop    %rbp
    2461:	c3                   	retq   
    2462:	0f 1f 40 00          	nopl   0x0(%rax)
    2466:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    246d:	00 00 00 

0000000000002470 <__do_global_dtors_aux>:
    2470:	80 3d b9 0c 20 00 00 	cmpb   $0x0,0x200cb9(%rip)        # 203130 <completed.7698>
    2477:	75 2f                	jne    24a8 <__do_global_dtors_aux+0x38>
    2479:	48 83 3d 4f 0b 20 00 	cmpq   $0x0,0x200b4f(%rip)        # 202fd0 <__cxa_finalize@GLIBC_2.2.5>
    2480:	00 
    2481:	55                   	push   %rbp
    2482:	48 89 e5             	mov    %rsp,%rbp
    2485:	74 0c                	je     2493 <__do_global_dtors_aux+0x23>
    2487:	48 8b 3d 7a 0b 20 00 	mov    0x200b7a(%rip),%rdi        # 203008 <__dso_handle>
    248e:	e8 3d ee ff ff       	callq  12d0 <__cxa_finalize@plt>
    2493:	e8 48 ff ff ff       	callq  23e0 <deregister_tm_clones>
    2498:	c6 05 91 0c 20 00 01 	movb   $0x1,0x200c91(%rip)        # 203130 <completed.7698>
    249f:	5d                   	pop    %rbp
    24a0:	c3                   	retq   
    24a1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    24a8:	f3 c3                	repz retq 
    24aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000024b0 <frame_dummy>:
    24b0:	55                   	push   %rbp
    24b1:	48 89 e5             	mov    %rsp,%rbp
    24b4:	5d                   	pop    %rbp
    24b5:	e9 66 ff ff ff       	jmpq   2420 <register_tm_clones>
    24ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000024c0 <__libc_csu_init>:
    24c0:	41 57                	push   %r15
    24c2:	41 56                	push   %r14
    24c4:	49 89 d7             	mov    %rdx,%r15
    24c7:	41 55                	push   %r13
    24c9:	41 54                	push   %r12
    24cb:	4c 8d 25 c6 07 20 00 	lea    0x2007c6(%rip),%r12        # 202c98 <__frame_dummy_init_array_entry>
    24d2:	55                   	push   %rbp
    24d3:	48 8d 2d ce 07 20 00 	lea    0x2007ce(%rip),%rbp        # 202ca8 <__init_array_end>
    24da:	53                   	push   %rbx
    24db:	41 89 fd             	mov    %edi,%r13d
    24de:	49 89 f6             	mov    %rsi,%r14
    24e1:	4c 29 e5             	sub    %r12,%rbp
    24e4:	48 83 ec 08          	sub    $0x8,%rsp
    24e8:	48 c1 fd 03          	sar    $0x3,%rbp
    24ec:	e8 bf eb ff ff       	callq  10b0 <_init>
    24f1:	48 85 ed             	test   %rbp,%rbp
    24f4:	74 20                	je     2516 <__libc_csu_init+0x56>
    24f6:	31 db                	xor    %ebx,%ebx
    24f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    24ff:	00 
    2500:	4c 89 fa             	mov    %r15,%rdx
    2503:	4c 89 f6             	mov    %r14,%rsi
    2506:	44 89 ef             	mov    %r13d,%edi
    2509:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
    250d:	48 83 c3 01          	add    $0x1,%rbx
    2511:	48 39 dd             	cmp    %rbx,%rbp
    2514:	75 ea                	jne    2500 <__libc_csu_init+0x40>
    2516:	48 83 c4 08          	add    $0x8,%rsp
    251a:	5b                   	pop    %rbx
    251b:	5d                   	pop    %rbp
    251c:	41 5c                	pop    %r12
    251e:	41 5d                	pop    %r13
    2520:	41 5e                	pop    %r14
    2522:	41 5f                	pop    %r15
    2524:	c3                   	retq   
    2525:	90                   	nop
    2526:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    252d:	00 00 00 

0000000000002530 <__libc_csu_fini>:
    2530:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000002534 <_fini>:
    2534:	48 83 ec 08          	sub    $0x8,%rsp
    2538:	48 83 c4 08          	add    $0x8,%rsp
    253c:	c3                   	retq   
