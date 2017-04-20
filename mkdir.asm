
_mkdir:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	57                   	push   %edi
   7:	56                   	push   %esi
   8:	53                   	push   %ebx
   9:	83 ec 14             	sub    $0x14,%esp
   c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  if(argc < 2){
   f:	83 ff 01             	cmp    $0x1,%edi
  12:	7e 5c                	jle    70 <main+0x70>
    printf(2, "Usage: mkdir files...\n");
    exit(0);
  14:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  17:	be 01 00 00 00       	mov    $0x1,%esi
  1c:	83 c3 04             	add    $0x4,%ebx
  1f:	90                   	nop
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
  20:	8b 03                	mov    (%ebx),%eax
  22:	89 04 24             	mov    %eax,(%esp)
  25:	e8 f6 02 00 00       	call   320 <mkdir>
  2a:	85 c0                	test   %eax,%eax
  2c:	78 1a                	js     48 <main+0x48>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit(0);
  }

  for(i = 1; i < argc; i++){
  2e:	83 c6 01             	add    $0x1,%esi
  31:	83 c3 04             	add    $0x4,%ebx
  34:	39 f7                	cmp    %esi,%edi
  36:	7f e8                	jg     20 <main+0x20>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit(0);
  38:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3f:	e8 74 02 00 00       	call   2b8 <exit>
  44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit(0);
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  48:	8b 03                	mov    (%ebx),%eax
  4a:	c7 44 24 04 6d 07 00 	movl   $0x76d,0x4(%esp)
  51:	00 
  52:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  59:	89 44 24 08          	mov    %eax,0x8(%esp)
  5d:	e8 8e 03 00 00       	call   3f0 <printf>
      break;
    }
  }

  exit(0);
  62:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  69:	e8 4a 02 00 00       	call   2b8 <exit>
  6e:	66 90                	xchg   %ax,%ax
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
  70:	c7 44 24 04 56 07 00 	movl   $0x756,0x4(%esp)
  77:	00 
  78:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  7f:	e8 6c 03 00 00       	call   3f0 <printf>
    exit(0);
  84:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8b:	e8 28 02 00 00       	call   2b8 <exit>

00000090 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  90:	55                   	push   %ebp
  91:	31 d2                	xor    %edx,%edx
  93:	89 e5                	mov    %esp,%ebp
  95:	8b 45 08             	mov    0x8(%ebp),%eax
  98:	53                   	push   %ebx
  99:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  a0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  a4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  a7:	83 c2 01             	add    $0x1,%edx
  aa:	84 c9                	test   %cl,%cl
  ac:	75 f2                	jne    a0 <strcpy+0x10>
    ;
  return os;
}
  ae:	5b                   	pop    %ebx
  af:	5d                   	pop    %ebp
  b0:	c3                   	ret    
  b1:	eb 0d                	jmp    c0 <strcmp>
  b3:	90                   	nop
  b4:	90                   	nop
  b5:	90                   	nop
  b6:	90                   	nop
  b7:	90                   	nop
  b8:	90                   	nop
  b9:	90                   	nop
  ba:	90                   	nop
  bb:	90                   	nop
  bc:	90                   	nop
  bd:	90                   	nop
  be:	90                   	nop
  bf:	90                   	nop

000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c6:	53                   	push   %ebx
  c7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ca:	0f b6 01             	movzbl (%ecx),%eax
  cd:	84 c0                	test   %al,%al
  cf:	75 14                	jne    e5 <strcmp+0x25>
  d1:	eb 25                	jmp    f8 <strcmp+0x38>
  d3:	90                   	nop
  d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
  d8:	83 c1 01             	add    $0x1,%ecx
  db:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  de:	0f b6 01             	movzbl (%ecx),%eax
  e1:	84 c0                	test   %al,%al
  e3:	74 13                	je     f8 <strcmp+0x38>
  e5:	0f b6 1a             	movzbl (%edx),%ebx
  e8:	38 d8                	cmp    %bl,%al
  ea:	74 ec                	je     d8 <strcmp+0x18>
  ec:	0f b6 db             	movzbl %bl,%ebx
  ef:	0f b6 c0             	movzbl %al,%eax
  f2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  f4:	5b                   	pop    %ebx
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f8:	0f b6 1a             	movzbl (%edx),%ebx
  fb:	31 c0                	xor    %eax,%eax
  fd:	0f b6 db             	movzbl %bl,%ebx
 100:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 102:	5b                   	pop    %ebx
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    
 105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <strlen>:

uint
strlen(char *s)
{
 110:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 111:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 113:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
 115:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 117:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 11a:	80 39 00             	cmpb   $0x0,(%ecx)
 11d:	74 0c                	je     12b <strlen+0x1b>
 11f:	90                   	nop
 120:	83 c2 01             	add    $0x1,%edx
 123:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 127:	89 d0                	mov    %edx,%eax
 129:	75 f5                	jne    120 <strlen+0x10>
    ;
  return n;
}
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	89 d0                	mov    %edx,%eax
 144:	5f                   	pop    %edi
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 11                	jne    172 <strchr+0x22>
 161:	eb 15                	jmp    178 <strchr+0x28>
 163:	90                   	nop
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 168:	83 c0 01             	add    $0x1,%eax
 16b:	0f b6 10             	movzbl (%eax),%edx
 16e:	84 d2                	test   %dl,%dl
 170:	74 06                	je     178 <strchr+0x28>
    if(*s == c)
 172:	38 ca                	cmp    %cl,%dl
 174:	75 f2                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 178:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*)s;
  return 0;
}
 17a:	5d                   	pop    %ebp
 17b:	90                   	nop
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 180:	c3                   	ret    
 181:	eb 0d                	jmp    190 <atoi>
 183:	90                   	nop
 184:	90                   	nop
 185:	90                   	nop
 186:	90                   	nop
 187:	90                   	nop
 188:	90                   	nop
 189:	90                   	nop
 18a:	90                   	nop
 18b:	90                   	nop
 18c:	90                   	nop
 18d:	90                   	nop
 18e:	90                   	nop
 18f:	90                   	nop

00000190 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 190:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 191:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 193:	89 e5                	mov    %esp,%ebp
 195:	8b 4d 08             	mov    0x8(%ebp),%ecx
 198:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 199:	0f b6 11             	movzbl (%ecx),%edx
 19c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 19f:	80 fb 09             	cmp    $0x9,%bl
 1a2:	77 1c                	ja     1c0 <atoi+0x30>
 1a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 1a8:	0f be d2             	movsbl %dl,%edx
 1ab:	83 c1 01             	add    $0x1,%ecx
 1ae:	8d 04 80             	lea    (%eax,%eax,4),%eax
 1b1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1b5:	0f b6 11             	movzbl (%ecx),%edx
 1b8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1bb:	80 fb 09             	cmp    $0x9,%bl
 1be:	76 e8                	jbe    1a8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 1c0:	5b                   	pop    %ebx
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    
 1c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	53                   	push   %ebx
 1d8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1de:	85 db                	test   %ebx,%ebx
 1e0:	7e 14                	jle    1f6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
 1e2:	31 d2                	xor    %edx,%edx
 1e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 1e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 1ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1ef:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 1f2:	39 da                	cmp    %ebx,%edx
 1f4:	75 f2                	jne    1e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 1f6:	5b                   	pop    %ebx
 1f7:	5e                   	pop    %esi
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    
 1fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000200 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 206:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
 209:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 20c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
 20f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 214:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 21b:	00 
 21c:	89 04 24             	mov    %eax,(%esp)
 21f:	e8 d4 00 00 00       	call   2f8 <open>
  if(fd < 0)
 224:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 226:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 228:	78 19                	js     243 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 1c 24             	mov    %ebx,(%esp)
 230:	89 44 24 04          	mov    %eax,0x4(%esp)
 234:	e8 d7 00 00 00       	call   310 <fstat>
  close(fd);
 239:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 23c:	89 c6                	mov    %eax,%esi
  close(fd);
 23e:	e8 9d 00 00 00       	call   2e0 <close>
  return r;
}
 243:	89 f0                	mov    %esi,%eax
 245:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 248:	8b 75 fc             	mov    -0x4(%ebp),%esi
 24b:	89 ec                	mov    %ebp,%esp
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    
 24f:	90                   	nop

00000250 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
 255:	31 f6                	xor    %esi,%esi
 257:	53                   	push   %ebx
 258:	83 ec 2c             	sub    $0x2c,%esp
 25b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 25e:	eb 06                	jmp    266 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 260:	3c 0a                	cmp    $0xa,%al
 262:	74 39                	je     29d <gets+0x4d>
 264:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 266:	8d 5e 01             	lea    0x1(%esi),%ebx
 269:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 26c:	7d 31                	jge    29f <gets+0x4f>
    cc = read(0, &c, 1);
 26e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 271:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 278:	00 
 279:	89 44 24 04          	mov    %eax,0x4(%esp)
 27d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 284:	e8 47 00 00 00       	call   2d0 <read>
    if(cc < 1)
 289:	85 c0                	test   %eax,%eax
 28b:	7e 12                	jle    29f <gets+0x4f>
      break;
    buf[i++] = c;
 28d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 291:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 295:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 299:	3c 0d                	cmp    $0xd,%al
 29b:	75 c3                	jne    260 <gets+0x10>
 29d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 29f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2a3:	89 f8                	mov    %edi,%eax
 2a5:	83 c4 2c             	add    $0x2c,%esp
 2a8:	5b                   	pop    %ebx
 2a9:	5e                   	pop    %esi
 2aa:	5f                   	pop    %edi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	90                   	nop
 2ae:	90                   	nop
 2af:	90                   	nop

000002b0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2b0:	b8 01 00 00 00       	mov    $0x1,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <exit>:
SYSCALL(exit)
 2b8:	b8 02 00 00 00       	mov    $0x2,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <wait>:
SYSCALL(wait)
 2c0:	b8 03 00 00 00       	mov    $0x3,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <pipe>:
SYSCALL(pipe)
 2c8:	b8 04 00 00 00       	mov    $0x4,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <read>:
SYSCALL(read)
 2d0:	b8 05 00 00 00       	mov    $0x5,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <write>:
SYSCALL(write)
 2d8:	b8 10 00 00 00       	mov    $0x10,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <close>:
SYSCALL(close)
 2e0:	b8 15 00 00 00       	mov    $0x15,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <kill>:
SYSCALL(kill)
 2e8:	b8 06 00 00 00       	mov    $0x6,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <exec>:
SYSCALL(exec)
 2f0:	b8 07 00 00 00       	mov    $0x7,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <open>:
SYSCALL(open)
 2f8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <mknod>:
SYSCALL(mknod)
 300:	b8 11 00 00 00       	mov    $0x11,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <unlink>:
SYSCALL(unlink)
 308:	b8 12 00 00 00       	mov    $0x12,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <fstat>:
SYSCALL(fstat)
 310:	b8 08 00 00 00       	mov    $0x8,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <link>:
SYSCALL(link)
 318:	b8 13 00 00 00       	mov    $0x13,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <mkdir>:
SYSCALL(mkdir)
 320:	b8 14 00 00 00       	mov    $0x14,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <chdir>:
SYSCALL(chdir)
 328:	b8 09 00 00 00       	mov    $0x9,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <dup>:
SYSCALL(dup)
 330:	b8 0a 00 00 00       	mov    $0xa,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <getpid>:
SYSCALL(getpid)
 338:	b8 0b 00 00 00       	mov    $0xb,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <sbrk>:
SYSCALL(sbrk)
 340:	b8 0c 00 00 00       	mov    $0xc,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <sleep>:
SYSCALL(sleep)
 348:	b8 0d 00 00 00       	mov    $0xd,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <uptime>:
SYSCALL(uptime)
 350:	b8 0e 00 00 00       	mov    $0xe,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <test>:
SYSCALL(test)
 358:	b8 16 00 00 00       	mov    $0x16,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	89 cf                	mov    %ecx,%edi
 366:	56                   	push   %esi
 367:	89 c6                	mov    %eax,%esi
 369:	53                   	push   %ebx
 36a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 36d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 370:	85 c9                	test   %ecx,%ecx
 372:	74 04                	je     378 <printint+0x18>
 374:	85 d2                	test   %edx,%edx
 376:	78 68                	js     3e0 <printint+0x80>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 378:	89 d0                	mov    %edx,%eax
 37a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 381:	31 c9                	xor    %ecx,%ecx
 383:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 386:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 388:	31 d2                	xor    %edx,%edx
 38a:	f7 f7                	div    %edi
 38c:	0f b6 92 90 07 00 00 	movzbl 0x790(%edx),%edx
 393:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 396:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
 399:	85 c0                	test   %eax,%eax
 39b:	75 eb                	jne    388 <printint+0x28>
  if(neg)
 39d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3a0:	85 c0                	test   %eax,%eax
 3a2:	74 08                	je     3ac <printint+0x4c>
    buf[i++] = '-';
 3a4:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
 3a9:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
 3ac:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3af:	90                   	nop
 3b0:	0f b6 04 3b          	movzbl (%ebx,%edi,1),%eax
 3b4:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3b7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3be:	00 
 3bf:	89 34 24             	mov    %esi,(%esp)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3c2:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3c5:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 3cc:	e8 07 ff ff ff       	call   2d8 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3d1:	83 ff ff             	cmp    $0xffffffff,%edi
 3d4:	75 da                	jne    3b0 <printint+0x50>
    putc(fd, buf[i]);
}
 3d6:	83 c4 4c             	add    $0x4c,%esp
 3d9:	5b                   	pop    %ebx
 3da:	5e                   	pop    %esi
 3db:	5f                   	pop    %edi
 3dc:	5d                   	pop    %ebp
 3dd:	c3                   	ret    
 3de:	66 90                	xchg   %ax,%ax
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3e0:	89 d0                	mov    %edx,%eax
 3e2:	f7 d8                	neg    %eax
 3e4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3eb:	eb 94                	jmp    381 <printint+0x21>
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fc:	0f b6 10             	movzbl (%eax),%edx
 3ff:	84 d2                	test   %dl,%dl
 401:	0f 84 c1 00 00 00    	je     4c8 <printf+0xd8>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 407:	8d 4d 10             	lea    0x10(%ebp),%ecx
 40a:	31 ff                	xor    %edi,%edi
 40c:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 40f:	31 db                	xor    %ebx,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 411:	8d 75 e7             	lea    -0x19(%ebp),%esi
 414:	eb 1e                	jmp    434 <printf+0x44>
 416:	66 90                	xchg   %ax,%ax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 418:	83 fa 25             	cmp    $0x25,%edx
 41b:	0f 85 af 00 00 00    	jne    4d0 <printf+0xe0>
 421:	66 bf 25 00          	mov    $0x25,%di
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 425:	83 c3 01             	add    $0x1,%ebx
 428:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 42c:	84 d2                	test   %dl,%dl
 42e:	0f 84 94 00 00 00    	je     4c8 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 434:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 436:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
 439:	74 dd                	je     418 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 43b:	83 ff 25             	cmp    $0x25,%edi
 43e:	75 e5                	jne    425 <printf+0x35>
      if(c == 'd'){
 440:	83 fa 64             	cmp    $0x64,%edx
 443:	0f 84 3f 01 00 00    	je     588 <printf+0x198>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 449:	83 fa 70             	cmp    $0x70,%edx
 44c:	0f 84 a6 00 00 00    	je     4f8 <printf+0x108>
 452:	83 fa 78             	cmp    $0x78,%edx
 455:	0f 84 9d 00 00 00    	je     4f8 <printf+0x108>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 45b:	83 fa 73             	cmp    $0x73,%edx
 45e:	66 90                	xchg   %ax,%ax
 460:	0f 84 ba 00 00 00    	je     520 <printf+0x130>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 466:	83 fa 63             	cmp    $0x63,%edx
 469:	0f 84 41 01 00 00    	je     5b0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 46f:	83 fa 25             	cmp    $0x25,%edx
 472:	0f 84 00 01 00 00    	je     578 <printf+0x188>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 478:	8b 4d 08             	mov    0x8(%ebp),%ecx
 47b:	89 55 cc             	mov    %edx,-0x34(%ebp)
 47e:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 482:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 489:	00 
 48a:	89 74 24 04          	mov    %esi,0x4(%esp)
 48e:	89 0c 24             	mov    %ecx,(%esp)
 491:	e8 42 fe ff ff       	call   2d8 <write>
 496:	8b 55 cc             	mov    -0x34(%ebp),%edx
 499:	88 55 e7             	mov    %dl,-0x19(%ebp)
 49c:	8b 45 08             	mov    0x8(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 49f:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4a2:	31 ff                	xor    %edi,%edi
 4a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ab:	00 
 4ac:	89 74 24 04          	mov    %esi,0x4(%esp)
 4b0:	89 04 24             	mov    %eax,(%esp)
 4b3:	e8 20 fe ff ff       	call   2d8 <write>
 4b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4bb:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
 4bf:	84 d2                	test   %dl,%dl
 4c1:	0f 85 6d ff ff ff    	jne    434 <printf+0x44>
 4c7:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4c8:	83 c4 3c             	add    $0x3c,%esp
 4cb:	5b                   	pop    %ebx
 4cc:	5e                   	pop    %esi
 4cd:	5f                   	pop    %edi
 4ce:	5d                   	pop    %ebp
 4cf:	c3                   	ret    
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4d3:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4d6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4dd:	00 
 4de:	89 74 24 04          	mov    %esi,0x4(%esp)
 4e2:	89 04 24             	mov    %eax,(%esp)
 4e5:	e8 ee fd ff ff       	call   2d8 <write>
 4ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ed:	e9 33 ff ff ff       	jmp    425 <printf+0x35>
 4f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4fb:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
 500:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 502:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 509:	8b 10                	mov    (%eax),%edx
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	e8 4d fe ff ff       	call   360 <printint>
 513:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 516:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 51a:	e9 06 ff ff ff       	jmp    425 <printf+0x35>
 51f:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
 520:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
        if(s == 0)
 523:	b9 89 07 00 00       	mov    $0x789,%ecx
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 528:	8b 3a                	mov    (%edx),%edi
        ap++;
 52a:	83 c2 04             	add    $0x4,%edx
 52d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
 530:	85 ff                	test   %edi,%edi
 532:	0f 44 f9             	cmove  %ecx,%edi
          s = "(null)";
        while(*s != 0){
 535:	0f b6 17             	movzbl (%edi),%edx
 538:	84 d2                	test   %dl,%dl
 53a:	74 33                	je     56f <printf+0x17f>
 53c:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 53f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 542:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          putc(fd, *s);
          s++;
 548:	83 c7 01             	add    $0x1,%edi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 54b:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 54e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 555:	00 
 556:	89 74 24 04          	mov    %esi,0x4(%esp)
 55a:	89 1c 24             	mov    %ebx,(%esp)
 55d:	e8 76 fd ff ff       	call   2d8 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 562:	0f b6 17             	movzbl (%edi),%edx
 565:	84 d2                	test   %dl,%dl
 567:	75 df                	jne    548 <printf+0x158>
 569:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 56c:	8b 45 0c             	mov    0xc(%ebp),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 56f:	31 ff                	xor    %edi,%edi
 571:	e9 af fe ff ff       	jmp    425 <printf+0x35>
 576:	66 90                	xchg   %ax,%ax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 578:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 57c:	e9 1b ff ff ff       	jmp    49c <printf+0xac>
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 588:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 58b:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
 590:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 593:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 59a:	8b 10                	mov    (%eax),%edx
 59c:	8b 45 08             	mov    0x8(%ebp),%eax
 59f:	e8 bc fd ff ff       	call   360 <printint>
 5a4:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
 5a7:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5ab:	e9 75 fe ff ff       	jmp    425 <printf+0x35>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5b0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        putc(fd, *ap);
        ap++;
 5b3:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5b8:	8b 02                	mov    (%edx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ba:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c1:	00 
 5c2:	89 74 24 04          	mov    %esi,0x4(%esp)
 5c6:	89 0c 24             	mov    %ecx,(%esp)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5c9:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5cc:	e8 07 fd ff ff       	call   2d8 <write>
 5d1:	8b 45 0c             	mov    0xc(%ebp),%eax
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 5d4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5d8:	e9 48 fe ff ff       	jmp    425 <printf+0x35>
 5dd:	90                   	nop
 5de:	90                   	nop
 5df:	90                   	nop

000005e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e1:	a1 ac 07 00 00       	mov    0x7ac,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e6:	89 e5                	mov    %esp,%ebp
 5e8:	57                   	push   %edi
 5e9:	56                   	push   %esi
 5ea:	53                   	push   %ebx
 5eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f1:	39 c8                	cmp    %ecx,%eax
 5f3:	73 1d                	jae    612 <free+0x32>
 5f5:	8d 76 00             	lea    0x0(%esi),%esi
 5f8:	8b 10                	mov    (%eax),%edx
 5fa:	39 d1                	cmp    %edx,%ecx
 5fc:	72 1a                	jb     618 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fe:	39 d0                	cmp    %edx,%eax
 600:	72 08                	jb     60a <free+0x2a>
 602:	39 c8                	cmp    %ecx,%eax
 604:	72 12                	jb     618 <free+0x38>
 606:	39 d1                	cmp    %edx,%ecx
 608:	72 0e                	jb     618 <free+0x38>
 60a:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60c:	39 c8                	cmp    %ecx,%eax
 60e:	66 90                	xchg   %ax,%ax
 610:	72 e6                	jb     5f8 <free+0x18>
 612:	8b 10                	mov    (%eax),%edx
 614:	eb e8                	jmp    5fe <free+0x1e>
 616:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 618:	8b 71 04             	mov    0x4(%ecx),%esi
 61b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 61e:	39 d7                	cmp    %edx,%edi
 620:	74 19                	je     63b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 622:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 625:	8b 50 04             	mov    0x4(%eax),%edx
 628:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 62b:	39 ce                	cmp    %ecx,%esi
 62d:	74 23                	je     652 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 62f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 631:	a3 ac 07 00 00       	mov    %eax,0x7ac
}
 636:	5b                   	pop    %ebx
 637:	5e                   	pop    %esi
 638:	5f                   	pop    %edi
 639:	5d                   	pop    %ebp
 63a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 63b:	03 72 04             	add    0x4(%edx),%esi
 63e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
 641:	8b 10                	mov    (%eax),%edx
 643:	8b 12                	mov    (%edx),%edx
 645:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 648:	8b 50 04             	mov    0x4(%eax),%edx
 64b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 64e:	39 ce                	cmp    %ecx,%esi
 650:	75 dd                	jne    62f <free+0x4f>
    p->s.size += bp->s.size;
 652:	03 51 04             	add    0x4(%ecx),%edx
 655:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 658:	8b 53 f8             	mov    -0x8(%ebx),%edx
 65b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
 65d:	a3 ac 07 00 00       	mov    %eax,0x7ac
}
 662:	5b                   	pop    %ebx
 663:	5e                   	pop    %esi
 664:	5f                   	pop    %edi
 665:	5d                   	pop    %ebp
 666:	c3                   	ret    
 667:	89 f6                	mov    %esi,%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
 676:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 679:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 67c:	8b 0d ac 07 00 00    	mov    0x7ac,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 682:	83 c3 07             	add    $0x7,%ebx
 685:	c1 eb 03             	shr    $0x3,%ebx
 688:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 68b:	85 c9                	test   %ecx,%ecx
 68d:	0f 84 9b 00 00 00    	je     72e <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 693:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 695:	8b 50 04             	mov    0x4(%eax),%edx
 698:	39 d3                	cmp    %edx,%ebx
 69a:	76 27                	jbe    6c3 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 69c:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6a3:	be 00 80 00 00       	mov    $0x8000,%esi
 6a8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6ab:	90                   	nop
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6b0:	3b 05 ac 07 00 00    	cmp    0x7ac,%eax
 6b6:	74 30                	je     6e8 <malloc+0x78>
 6b8:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6ba:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
 6bc:	8b 50 04             	mov    0x4(%eax),%edx
 6bf:	39 d3                	cmp    %edx,%ebx
 6c1:	77 ed                	ja     6b0 <malloc+0x40>
      if(p->s.size == nunits)
 6c3:	39 d3                	cmp    %edx,%ebx
 6c5:	74 61                	je     728 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6c7:	29 da                	sub    %ebx,%edx
 6c9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 6cc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 6cf:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6d2:	89 0d ac 07 00 00    	mov    %ecx,0x7ac
      return (void*)(p + 1);
 6d8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6db:	83 c4 2c             	add    $0x2c,%esp
 6de:	5b                   	pop    %ebx
 6df:	5e                   	pop    %esi
 6e0:	5f                   	pop    %edi
 6e1:	5d                   	pop    %ebp
 6e2:	c3                   	ret    
 6e3:	90                   	nop
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6eb:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 6f1:	bf 00 10 00 00       	mov    $0x1000,%edi
 6f6:	0f 43 fb             	cmovae %ebx,%edi
 6f9:	0f 42 c6             	cmovb  %esi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6fc:	89 04 24             	mov    %eax,(%esp)
 6ff:	e8 3c fc ff ff       	call   340 <sbrk>
  if(p == (char*)-1)
 704:	83 f8 ff             	cmp    $0xffffffff,%eax
 707:	74 18                	je     721 <malloc+0xb1>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 709:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 70c:	83 c0 08             	add    $0x8,%eax
 70f:	89 04 24             	mov    %eax,(%esp)
 712:	e8 c9 fe ff ff       	call   5e0 <free>
  return freep;
 717:	8b 0d ac 07 00 00    	mov    0x7ac,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 71d:	85 c9                	test   %ecx,%ecx
 71f:	75 99                	jne    6ba <malloc+0x4a>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 721:	31 c0                	xor    %eax,%eax
 723:	eb b6                	jmp    6db <malloc+0x6b>
 725:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 728:	8b 10                	mov    (%eax),%edx
 72a:	89 11                	mov    %edx,(%ecx)
 72c:	eb a4                	jmp    6d2 <malloc+0x62>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 72e:	c7 05 ac 07 00 00 a4 	movl   $0x7a4,0x7ac
 735:	07 00 00 
    base.s.size = 0;
 738:	b9 a4 07 00 00       	mov    $0x7a4,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 73d:	c7 05 a4 07 00 00 a4 	movl   $0x7a4,0x7a4
 744:	07 00 00 
    base.s.size = 0;
 747:	c7 05 a8 07 00 00 00 	movl   $0x0,0x7a8
 74e:	00 00 00 
 751:	e9 3d ff ff ff       	jmp    693 <malloc+0x23>
