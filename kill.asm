
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	57                   	push   %edi
   7:	56                   	push   %esi
   8:	53                   	push   %ebx
  int i;

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit(0);
   9:	bb 01 00 00 00       	mov    $0x1,%ebx
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   e:	83 ec 14             	sub    $0x14,%esp
  11:	8b 75 08             	mov    0x8(%ebp),%esi
  14:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  if(argc < 2){
  17:	83 fe 01             	cmp    $0x1,%esi
  1a:	7e 2c                	jle    48 <main+0x48>
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit(0);
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  20:	8b 04 9f             	mov    (%edi,%ebx,4),%eax

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit(0);
  }
  for(i=1; i<argc; i++)
  23:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
  26:	89 04 24             	mov    %eax,(%esp)
  29:	e8 42 01 00 00       	call   170 <atoi>
  2e:	89 04 24             	mov    %eax,(%esp)
  31:	e8 92 02 00 00       	call   2c8 <kill>

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit(0);
  }
  for(i=1; i<argc; i++)
  36:	39 de                	cmp    %ebx,%esi
  38:	7f e6                	jg     20 <main+0x20>
    kill(atoi(argv[i]));
  exit(0);
  3a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  41:	e8 52 02 00 00       	call   298 <exit>
  46:	66 90                	xchg   %ax,%ax
main(int argc, char **argv)
{
  int i;

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
  48:	c7 44 24 04 36 07 00 	movl   $0x736,0x4(%esp)
  4f:	00 
  50:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  57:	e8 74 03 00 00       	call   3d0 <printf>
    exit(0);
  5c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  63:	e8 30 02 00 00       	call   298 <exit>
  68:	90                   	nop
  69:	90                   	nop
  6a:	90                   	nop
  6b:	90                   	nop
  6c:	90                   	nop
  6d:	90                   	nop
  6e:	90                   	nop
  6f:	90                   	nop

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  70:	55                   	push   %ebp
  71:	31 d2                	xor    %edx,%edx
  73:	89 e5                	mov    %esp,%ebp
  75:	8b 45 08             	mov    0x8(%ebp),%eax
  78:	53                   	push   %ebx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  80:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  84:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 c9                	test   %cl,%cl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	5b                   	pop    %ebx
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    
  91:	eb 0d                	jmp    a0 <strcmp>
  93:	90                   	nop
  94:	90                   	nop
  95:	90                   	nop
  96:	90                   	nop
  97:	90                   	nop
  98:	90                   	nop
  99:	90                   	nop
  9a:	90                   	nop
  9b:	90                   	nop
  9c:	90                   	nop
  9d:	90                   	nop
  9e:	90                   	nop
  9f:	90                   	nop

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  a6:	53                   	push   %ebx
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  aa:	0f b6 01             	movzbl (%ecx),%eax
  ad:	84 c0                	test   %al,%al
  af:	75 14                	jne    c5 <strcmp+0x25>
  b1:	eb 25                	jmp    d8 <strcmp+0x38>
  b3:	90                   	nop
  b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
  b8:	83 c1 01             	add    $0x1,%ecx
  bb:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  be:	0f b6 01             	movzbl (%ecx),%eax
  c1:	84 c0                	test   %al,%al
  c3:	74 13                	je     d8 <strcmp+0x38>
  c5:	0f b6 1a             	movzbl (%edx),%ebx
  c8:	38 d8                	cmp    %bl,%al
  ca:	74 ec                	je     b8 <strcmp+0x18>
  cc:	0f b6 db             	movzbl %bl,%ebx
  cf:	0f b6 c0             	movzbl %al,%eax
  d2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  d4:	5b                   	pop    %ebx
  d5:	5d                   	pop    %ebp
  d6:	c3                   	ret    
  d7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d8:	0f b6 1a             	movzbl (%edx),%ebx
  db:	31 c0                	xor    %eax,%eax
  dd:	0f b6 db             	movzbl %bl,%ebx
  e0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  e2:	5b                   	pop    %ebx
  e3:	5d                   	pop    %ebp
  e4:	c3                   	ret    
  e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000f0 <strlen>:

uint
strlen(char *s)
{
  f0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
  f1:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  f3:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
  f5:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  fa:	80 39 00             	cmpb   $0x0,(%ecx)
  fd:	74 0c                	je     10b <strlen+0x1b>
  ff:	90                   	nop
 100:	83 c2 01             	add    $0x1,%edx
 103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 107:	89 d0                	mov    %edx,%eax
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
 10d:	8d 76 00             	lea    0x0(%esi),%esi

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 55 08             	mov    0x8(%ebp),%edx
 116:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	89 f6                	mov    %esi,%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 13a:	0f b6 10             	movzbl (%eax),%edx
 13d:	84 d2                	test   %dl,%dl
 13f:	75 11                	jne    152 <strchr+0x22>
 141:	eb 15                	jmp    158 <strchr+0x28>
 143:	90                   	nop
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 148:	83 c0 01             	add    $0x1,%eax
 14b:	0f b6 10             	movzbl (%eax),%edx
 14e:	84 d2                	test   %dl,%dl
 150:	74 06                	je     158 <strchr+0x28>
    if(*s == c)
 152:	38 ca                	cmp    %cl,%dl
 154:	75 f2                	jne    148 <strchr+0x18>
      return (char*)s;
  return 0;
}
 156:	5d                   	pop    %ebp
 157:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 158:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*)s;
  return 0;
}
 15a:	5d                   	pop    %ebp
 15b:	90                   	nop
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 160:	c3                   	ret    
 161:	eb 0d                	jmp    170 <atoi>
 163:	90                   	nop
 164:	90                   	nop
 165:	90                   	nop
 166:	90                   	nop
 167:	90                   	nop
 168:	90                   	nop
 169:	90                   	nop
 16a:	90                   	nop
 16b:	90                   	nop
 16c:	90                   	nop
 16d:	90                   	nop
 16e:	90                   	nop
 16f:	90                   	nop

00000170 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 170:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 171:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 173:	89 e5                	mov    %esp,%ebp
 175:	8b 4d 08             	mov    0x8(%ebp),%ecx
 178:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 179:	0f b6 11             	movzbl (%ecx),%edx
 17c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 17f:	80 fb 09             	cmp    $0x9,%bl
 182:	77 1c                	ja     1a0 <atoi+0x30>
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 188:	0f be d2             	movsbl %dl,%edx
 18b:	83 c1 01             	add    $0x1,%ecx
 18e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 191:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 195:	0f b6 11             	movzbl (%ecx),%edx
 198:	8d 5a d0             	lea    -0x30(%edx),%ebx
 19b:	80 fb 09             	cmp    $0x9,%bl
 19e:	76 e8                	jbe    188 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 1a0:	5b                   	pop    %ebx
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    
 1a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	53                   	push   %ebx
 1b8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1be:	85 db                	test   %ebx,%ebx
 1c0:	7e 14                	jle    1d6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 1c2:	31 d2                	xor    %edx,%edx
 1c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 1c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 1cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1cf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1d2:	39 da                	cmp    %ebx,%edx
 1d4:	75 f2                	jne    1c8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 1d6:	5b                   	pop    %ebx
 1d7:	5e                   	pop    %esi
 1d8:	5d                   	pop    %ebp
 1d9:	c3                   	ret    
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001e0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 1e9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1ec:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 1ef:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1fb:	00 
 1fc:	89 04 24             	mov    %eax,(%esp)
 1ff:	e8 d4 00 00 00       	call   2d8 <open>
  if(fd < 0)
 204:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 206:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 208:	78 19                	js     223 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 1c 24             	mov    %ebx,(%esp)
 210:	89 44 24 04          	mov    %eax,0x4(%esp)
 214:	e8 d7 00 00 00       	call   2f0 <fstat>
  close(fd);
 219:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 21c:	89 c6                	mov    %eax,%esi
  close(fd);
 21e:	e8 9d 00 00 00       	call   2c0 <close>
  return r;
}
 223:	89 f0                	mov    %esi,%eax
 225:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 228:	8b 75 fc             	mov    -0x4(%ebp),%esi
 22b:	89 ec                	mov    %ebp,%esp
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret    
 22f:	90                   	nop

00000230 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	31 f6                	xor    %esi,%esi
 237:	53                   	push   %ebx
 238:	83 ec 2c             	sub    $0x2c,%esp
 23b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 23e:	eb 06                	jmp    246 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 240:	3c 0a                	cmp    $0xa,%al
 242:	74 39                	je     27d <gets+0x4d>
 244:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 246:	8d 5e 01             	lea    0x1(%esi),%ebx
 249:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24c:	7d 31                	jge    27f <gets+0x4f>
    cc = read(0, &c, 1);
 24e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 251:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 258:	00 
 259:	89 44 24 04          	mov    %eax,0x4(%esp)
 25d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 264:	e8 47 00 00 00       	call   2b0 <read>
    if(cc < 1)
 269:	85 c0                	test   %eax,%eax
 26b:	7e 12                	jle    27f <gets+0x4f>
      break;
    buf[i++] = c;
 26d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 271:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 275:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 279:	3c 0d                	cmp    $0xd,%al
 27b:	75 c3                	jne    240 <gets+0x10>
 27d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 27f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 283:	89 f8                	mov    %edi,%eax
 285:	83 c4 2c             	add    $0x2c,%esp
 288:	5b                   	pop    %ebx
 289:	5e                   	pop    %esi
 28a:	5f                   	pop    %edi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	90                   	nop
 28e:	90                   	nop
 28f:	90                   	nop

00000290 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 290:	b8 01 00 00 00       	mov    $0x1,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <exit>:
SYSCALL(exit)
 298:	b8 02 00 00 00       	mov    $0x2,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <wait>:
SYSCALL(wait)
 2a0:	b8 03 00 00 00       	mov    $0x3,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <pipe>:
SYSCALL(pipe)
 2a8:	b8 04 00 00 00       	mov    $0x4,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <read>:
SYSCALL(read)
 2b0:	b8 05 00 00 00       	mov    $0x5,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <write>:
SYSCALL(write)
 2b8:	b8 10 00 00 00       	mov    $0x10,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <close>:
SYSCALL(close)
 2c0:	b8 15 00 00 00       	mov    $0x15,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <kill>:
SYSCALL(kill)
 2c8:	b8 06 00 00 00       	mov    $0x6,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <exec>:
SYSCALL(exec)
 2d0:	b8 07 00 00 00       	mov    $0x7,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <open>:
SYSCALL(open)
 2d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <mknod>:
SYSCALL(mknod)
 2e0:	b8 11 00 00 00       	mov    $0x11,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <unlink>:
SYSCALL(unlink)
 2e8:	b8 12 00 00 00       	mov    $0x12,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <fstat>:
SYSCALL(fstat)
 2f0:	b8 08 00 00 00       	mov    $0x8,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <link>:
SYSCALL(link)
 2f8:	b8 13 00 00 00       	mov    $0x13,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <mkdir>:
SYSCALL(mkdir)
 300:	b8 14 00 00 00       	mov    $0x14,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <chdir>:
SYSCALL(chdir)
 308:	b8 09 00 00 00       	mov    $0x9,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <dup>:
SYSCALL(dup)
 310:	b8 0a 00 00 00       	mov    $0xa,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <getpid>:
SYSCALL(getpid)
 318:	b8 0b 00 00 00       	mov    $0xb,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <sbrk>:
SYSCALL(sbrk)
 320:	b8 0c 00 00 00       	mov    $0xc,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <sleep>:
SYSCALL(sleep)
 328:	b8 0d 00 00 00       	mov    $0xd,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <uptime>:
SYSCALL(uptime)
 330:	b8 0e 00 00 00       	mov    $0xe,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <test>:
SYSCALL(test)
 338:	b8 16 00 00 00       	mov    $0x16,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	89 cf                	mov    %ecx,%edi
 346:	56                   	push   %esi
 347:	89 c6                	mov    %eax,%esi
 349:	53                   	push   %ebx
 34a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 34d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 350:	85 c9                	test   %ecx,%ecx
 352:	74 04                	je     358 <printint+0x18>
 354:	85 d2                	test   %edx,%edx
 356:	78 68                	js     3c0 <printint+0x80>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 358:	89 d0                	mov    %edx,%eax
 35a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 361:	31 c9                	xor    %ecx,%ecx
 363:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 366:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 368:	31 d2                	xor    %edx,%edx
 36a:	f7 f7                	div    %edi
 36c:	0f b6 92 51 07 00 00 	movzbl 0x751(%edx),%edx
 373:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 376:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 379:	85 c0                	test   %eax,%eax
 37b:	75 eb                	jne    368 <printint+0x28>
  if(neg)
 37d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 380:	85 c0                	test   %eax,%eax
 382:	74 08                	je     38c <printint+0x4c>
    buf[i++] = '-';
 384:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 389:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 38c:	8d 79 ff             	lea    -0x1(%ecx),%edi
 38f:	90                   	nop
 390:	0f b6 04 3b          	movzbl (%ebx,%edi,1),%eax
 394:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 397:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 39e:	00 
 39f:	89 34 24             	mov    %esi,(%esp)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3a2:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3a5:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 3ac:	e8 07 ff ff ff       	call   2b8 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3b1:	83 ff ff             	cmp    $0xffffffff,%edi
 3b4:	75 da                	jne    390 <printint+0x50>
    putc(fd, buf[i]);
}
 3b6:	83 c4 4c             	add    $0x4c,%esp
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5f                   	pop    %edi
 3bc:	5d                   	pop    %ebp
 3bd:	c3                   	ret    
 3be:	66 90                	xchg   %ax,%ax
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3c0:	89 d0                	mov    %edx,%eax
 3c2:	f7 d8                	neg    %eax
 3c4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3cb:	eb 94                	jmp    361 <printint+0x21>
 3cd:	8d 76 00             	lea    0x0(%esi),%esi

000003d0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dc:	0f b6 10             	movzbl (%eax),%edx
 3df:	84 d2                	test   %dl,%dl
 3e1:	0f 84 c1 00 00 00    	je     4a8 <printf+0xd8>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3e7:	8d 4d 10             	lea    0x10(%ebp),%ecx
 3ea:	31 ff                	xor    %edi,%edi
 3ec:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 3ef:	31 db                	xor    %ebx,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3f1:	8d 75 e7             	lea    -0x19(%ebp),%esi
 3f4:	eb 1e                	jmp    414 <printf+0x44>
 3f6:	66 90                	xchg   %ax,%ax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3f8:	83 fa 25             	cmp    $0x25,%edx
 3fb:	0f 85 af 00 00 00    	jne    4b0 <printf+0xe0>
 401:	66 bf 25 00          	mov    $0x25,%di
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 405:	83 c3 01             	add    $0x1,%ebx
 408:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 40c:	84 d2                	test   %dl,%dl
 40e:	0f 84 94 00 00 00    	je     4a8 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 414:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 416:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 419:	74 dd                	je     3f8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 41b:	83 ff 25             	cmp    $0x25,%edi
 41e:	75 e5                	jne    405 <printf+0x35>
      if(c == 'd'){
 420:	83 fa 64             	cmp    $0x64,%edx
 423:	0f 84 3f 01 00 00    	je     568 <printf+0x198>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 429:	83 fa 70             	cmp    $0x70,%edx
 42c:	0f 84 a6 00 00 00    	je     4d8 <printf+0x108>
 432:	83 fa 78             	cmp    $0x78,%edx
 435:	0f 84 9d 00 00 00    	je     4d8 <printf+0x108>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 43b:	83 fa 73             	cmp    $0x73,%edx
 43e:	66 90                	xchg   %ax,%ax
 440:	0f 84 ba 00 00 00    	je     500 <printf+0x130>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 446:	83 fa 63             	cmp    $0x63,%edx
 449:	0f 84 41 01 00 00    	je     590 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 44f:	83 fa 25             	cmp    $0x25,%edx
 452:	0f 84 00 01 00 00    	je     558 <printf+0x188>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 458:	8b 4d 08             	mov    0x8(%ebp),%ecx
 45b:	89 55 cc             	mov    %edx,-0x34(%ebp)
 45e:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 462:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 469:	00 
 46a:	89 74 24 04          	mov    %esi,0x4(%esp)
 46e:	89 0c 24             	mov    %ecx,(%esp)
 471:	e8 42 fe ff ff       	call   2b8 <write>
 476:	8b 55 cc             	mov    -0x34(%ebp),%edx
 479:	88 55 e7             	mov    %dl,-0x19(%ebp)
 47c:	8b 45 08             	mov    0x8(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 47f:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 482:	31 ff                	xor    %edi,%edi
 484:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 48b:	00 
 48c:	89 74 24 04          	mov    %esi,0x4(%esp)
 490:	89 04 24             	mov    %eax,(%esp)
 493:	e8 20 fe ff ff       	call   2b8 <write>
 498:	8b 45 0c             	mov    0xc(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 49b:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 49f:	84 d2                	test   %dl,%dl
 4a1:	0f 85 6d ff ff ff    	jne    414 <printf+0x44>
 4a7:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4a8:	83 c4 3c             	add    $0x3c,%esp
 4ab:	5b                   	pop    %ebx
 4ac:	5e                   	pop    %esi
 4ad:	5f                   	pop    %edi
 4ae:	5d                   	pop    %ebp
 4af:	c3                   	ret    
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4b0:	8b 45 08             	mov    0x8(%ebp),%eax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4b3:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4b6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4bd:	00 
 4be:	89 74 24 04          	mov    %esi,0x4(%esp)
 4c2:	89 04 24             	mov    %eax,(%esp)
 4c5:	e8 ee fd ff ff       	call   2b8 <write>
 4ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cd:	e9 33 ff ff ff       	jmp    405 <printf+0x35>
 4d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4db:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 4e0:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4e9:	8b 10                	mov    (%eax),%edx
 4eb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ee:	e8 4d fe ff ff       	call   340 <printint>
 4f3:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 4f6:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4fa:	e9 06 ff ff ff       	jmp    405 <printf+0x35>
 4ff:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 500:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
        if(s == 0)
 503:	b9 4a 07 00 00       	mov    $0x74a,%ecx
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 508:	8b 3a                	mov    (%edx),%edi
        ap++;
 50a:	83 c2 04             	add    $0x4,%edx
 50d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 510:	85 ff                	test   %edi,%edi
 512:	0f 44 f9             	cmove  %ecx,%edi
          s = "(null)";
        while(*s != 0){
 515:	0f b6 17             	movzbl (%edi),%edx
 518:	84 d2                	test   %dl,%dl
 51a:	74 33                	je     54f <printf+0x17f>
 51c:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 51f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          putc(fd, *s);
          s++;
 528:	83 c7 01             	add    $0x1,%edi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 52b:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 52e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 535:	00 
 536:	89 74 24 04          	mov    %esi,0x4(%esp)
 53a:	89 1c 24             	mov    %ebx,(%esp)
 53d:	e8 76 fd ff ff       	call   2b8 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 542:	0f b6 17             	movzbl (%edi),%edx
 545:	84 d2                	test   %dl,%dl
 547:	75 df                	jne    528 <printf+0x158>
 549:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 54c:	8b 45 0c             	mov    0xc(%ebp),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 54f:	31 ff                	xor    %edi,%edi
 551:	e9 af fe ff ff       	jmp    405 <printf+0x35>
 556:	66 90                	xchg   %ax,%ax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 558:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 55c:	e9 1b ff ff ff       	jmp    47c <printf+0xac>
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 568:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 56b:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 570:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 573:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 57a:	8b 10                	mov    (%eax),%edx
 57c:	8b 45 08             	mov    0x8(%ebp),%eax
 57f:	e8 bc fd ff ff       	call   340 <printint>
 584:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 587:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 58b:	e9 75 fe ff ff       	jmp    405 <printf+0x35>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 590:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        putc(fd, *ap);
        ap++;
 593:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 595:	8b 4d 08             	mov    0x8(%ebp),%ecx
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 598:	8b 02                	mov    (%edx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 59a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5a1:	00 
 5a2:	89 74 24 04          	mov    %esi,0x4(%esp)
 5a6:	89 0c 24             	mov    %ecx,(%esp)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5a9:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ac:	e8 07 fd ff ff       	call   2b8 <write>
 5b1:	8b 45 0c             	mov    0xc(%ebp),%eax
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 5b4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5b8:	e9 48 fe ff ff       	jmp    405 <printf+0x35>
 5bd:	90                   	nop
 5be:	90                   	nop
 5bf:	90                   	nop

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	a1 6c 07 00 00       	mov    0x76c,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	39 c8                	cmp    %ecx,%eax
 5d3:	73 1d                	jae    5f2 <free+0x32>
 5d5:	8d 76 00             	lea    0x0(%esi),%esi
 5d8:	8b 10                	mov    (%eax),%edx
 5da:	39 d1                	cmp    %edx,%ecx
 5dc:	72 1a                	jb     5f8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5de:	39 d0                	cmp    %edx,%eax
 5e0:	72 08                	jb     5ea <free+0x2a>
 5e2:	39 c8                	cmp    %ecx,%eax
 5e4:	72 12                	jb     5f8 <free+0x38>
 5e6:	39 d1                	cmp    %edx,%ecx
 5e8:	72 0e                	jb     5f8 <free+0x38>
 5ea:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ec:	39 c8                	cmp    %ecx,%eax
 5ee:	66 90                	xchg   %ax,%ax
 5f0:	72 e6                	jb     5d8 <free+0x18>
 5f2:	8b 10                	mov    (%eax),%edx
 5f4:	eb e8                	jmp    5de <free+0x1e>
 5f6:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 5f8:	8b 71 04             	mov    0x4(%ecx),%esi
 5fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5fe:	39 d7                	cmp    %edx,%edi
 600:	74 19                	je     61b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 602:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 605:	8b 50 04             	mov    0x4(%eax),%edx
 608:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 60b:	39 ce                	cmp    %ecx,%esi
 60d:	74 23                	je     632 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 60f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 611:	a3 6c 07 00 00       	mov    %eax,0x76c
}
 616:	5b                   	pop    %ebx
 617:	5e                   	pop    %esi
 618:	5f                   	pop    %edi
 619:	5d                   	pop    %ebp
 61a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 61b:	03 72 04             	add    0x4(%edx),%esi
 61e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 621:	8b 10                	mov    (%eax),%edx
 623:	8b 12                	mov    (%edx),%edx
 625:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 628:	8b 50 04             	mov    0x4(%eax),%edx
 62b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 62e:	39 ce                	cmp    %ecx,%esi
 630:	75 dd                	jne    60f <free+0x4f>
    p->s.size += bp->s.size;
 632:	03 51 04             	add    0x4(%ecx),%edx
 635:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 638:	8b 53 f8             	mov    -0x8(%ebx),%edx
 63b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 63d:	a3 6c 07 00 00       	mov    %eax,0x76c
}
 642:	5b                   	pop    %ebx
 643:	5e                   	pop    %esi
 644:	5f                   	pop    %edi
 645:	5d                   	pop    %ebp
 646:	c3                   	ret    
 647:	89 f6                	mov    %esi,%esi
 649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 659:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 65c:	8b 0d 6c 07 00 00    	mov    0x76c,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 662:	83 c3 07             	add    $0x7,%ebx
 665:	c1 eb 03             	shr    $0x3,%ebx
 668:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 66b:	85 c9                	test   %ecx,%ecx
 66d:	0f 84 9b 00 00 00    	je     70e <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 673:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 675:	8b 50 04             	mov    0x4(%eax),%edx
 678:	39 d3                	cmp    %edx,%ebx
 67a:	76 27                	jbe    6a3 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 67c:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 683:	be 00 80 00 00       	mov    $0x8000,%esi
 688:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 68b:	90                   	nop
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 690:	3b 05 6c 07 00 00    	cmp    0x76c,%eax
 696:	74 30                	je     6c8 <malloc+0x78>
 698:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 69a:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 69c:	8b 50 04             	mov    0x4(%eax),%edx
 69f:	39 d3                	cmp    %edx,%ebx
 6a1:	77 ed                	ja     690 <malloc+0x40>
      if(p->s.size == nunits)
 6a3:	39 d3                	cmp    %edx,%ebx
 6a5:	74 61                	je     708 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6a7:	29 da                	sub    %ebx,%edx
 6a9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6ac:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6af:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6b2:	89 0d 6c 07 00 00    	mov    %ecx,0x76c
      return (void*)(p + 1);
 6b8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6bb:	83 c4 2c             	add    $0x2c,%esp
 6be:	5b                   	pop    %ebx
 6bf:	5e                   	pop    %esi
 6c0:	5f                   	pop    %edi
 6c1:	5d                   	pop    %ebp
 6c2:	c3                   	ret    
 6c3:	90                   	nop
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6cb:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 6d1:	bf 00 10 00 00       	mov    $0x1000,%edi
 6d6:	0f 43 fb             	cmovae %ebx,%edi
 6d9:	0f 42 c6             	cmovb  %esi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6dc:	89 04 24             	mov    %eax,(%esp)
 6df:	e8 3c fc ff ff       	call   320 <sbrk>
  if(p == (char*)-1)
 6e4:	83 f8 ff             	cmp    $0xffffffff,%eax
 6e7:	74 18                	je     701 <malloc+0xb1>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6e9:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 6ec:	83 c0 08             	add    $0x8,%eax
 6ef:	89 04 24             	mov    %eax,(%esp)
 6f2:	e8 c9 fe ff ff       	call   5c0 <free>
  return freep;
 6f7:	8b 0d 6c 07 00 00    	mov    0x76c,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 6fd:	85 c9                	test   %ecx,%ecx
 6ff:	75 99                	jne    69a <malloc+0x4a>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 701:	31 c0                	xor    %eax,%eax
 703:	eb b6                	jmp    6bb <malloc+0x6b>
 705:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 708:	8b 10                	mov    (%eax),%edx
 70a:	89 11                	mov    %edx,(%ecx)
 70c:	eb a4                	jmp    6b2 <malloc+0x62>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 70e:	c7 05 6c 07 00 00 64 	movl   $0x764,0x76c
 715:	07 00 00 
    base.s.size = 0;
 718:	b9 64 07 00 00       	mov    $0x764,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 71d:	c7 05 64 07 00 00 64 	movl   $0x764,0x764
 724:	07 00 00 
    base.s.size = 0;
 727:	c7 05 68 07 00 00 00 	movl   $0x0,0x768
 72e:	00 00 00 
 731:	e9 3d ff ff ff       	jmp    673 <malloc+0x23>
