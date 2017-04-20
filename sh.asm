
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	53                   	push   %ebx
       4:	83 ec 14             	sub    $0x14,%esp
       7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       a:	85 db                	test   %ebx,%ebx
       c:	74 05                	je     13 <nulterminate+0x13>
    return 0;

  switch(cmd->type){
       e:	83 3b 05             	cmpl   $0x5,(%ebx)
      11:	76 0d                	jbe    20 <nulterminate+0x20>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
      13:	89 d8                	mov    %ebx,%eax
      15:	83 c4 14             	add    $0x14,%esp
      18:	5b                   	pop    %ebx
      19:	5d                   	pop    %ebp
      1a:	c3                   	ret    
      1b:	90                   	nop
      1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
      20:	8b 03                	mov    (%ebx),%eax
      22:	ff 24 85 48 13 00 00 	jmp    *0x1348(,%eax,4)
      29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
      30:	8b 43 04             	mov    0x4(%ebx),%eax
      33:	89 04 24             	mov    %eax,(%esp)
      36:	e8 c5 ff ff ff       	call   0 <nulterminate>
    nulterminate(lcmd->right);
      3b:	8b 43 08             	mov    0x8(%ebx),%eax
      3e:	89 04 24             	mov    %eax,(%esp)
      41:	e8 ba ff ff ff       	call   0 <nulterminate>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
      46:	89 d8                	mov    %ebx,%eax
      48:	83 c4 14             	add    $0x14,%esp
      4b:	5b                   	pop    %ebx
      4c:	5d                   	pop    %ebp
      4d:	c3                   	ret    
      4e:	66 90                	xchg   %ax,%ax
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
      50:	8b 43 04             	mov    0x4(%ebx),%eax
      53:	89 04 24             	mov    %eax,(%esp)
      56:	e8 a5 ff ff ff       	call   0 <nulterminate>
    break;
  }
  return cmd;
}
      5b:	89 d8                	mov    %ebx,%eax
      5d:	83 c4 14             	add    $0x14,%esp
      60:	5b                   	pop    %ebx
      61:	5d                   	pop    %ebp
      62:	c3                   	ret    
      63:	90                   	nop
      64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
      68:	8b 43 04             	mov    0x4(%ebx),%eax
      6b:	89 04 24             	mov    %eax,(%esp)
      6e:	e8 8d ff ff ff       	call   0 <nulterminate>
    *rcmd->efile = 0;
      73:	8b 43 0c             	mov    0xc(%ebx),%eax
      76:	c6 00 00             	movb   $0x0,(%eax)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
      79:	89 d8                	mov    %ebx,%eax
      7b:	83 c4 14             	add    $0x14,%esp
      7e:	5b                   	pop    %ebx
      7f:	5d                   	pop    %ebp
      80:	c3                   	ret    
      81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      88:	8b 43 04             	mov    0x4(%ebx),%eax
      8b:	85 c0                	test   %eax,%eax
      8d:	74 84                	je     13 <nulterminate+0x13>
      8f:	89 d8                	mov    %ebx,%eax
      91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
      98:	8b 50 2c             	mov    0x2c(%eax),%edx
      9b:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      9e:	8b 50 08             	mov    0x8(%eax),%edx
      a1:	83 c0 04             	add    $0x4,%eax
      a4:	85 d2                	test   %edx,%edx
      a6:	75 f0                	jne    98 <nulterminate+0x98>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
      a8:	89 d8                	mov    %ebx,%eax
      aa:	83 c4 14             	add    $0x14,%esp
      ad:	5b                   	pop    %ebx
      ae:	5d                   	pop    %ebp
      af:	c3                   	ret    

000000b0 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
      b0:	55                   	push   %ebp
      b1:	89 e5                	mov    %esp,%ebp
      b3:	57                   	push   %edi
      b4:	56                   	push   %esi
      b5:	53                   	push   %ebx
      b6:	83 ec 1c             	sub    $0x1c,%esp
      b9:	8b 7d 08             	mov    0x8(%ebp),%edi
      bc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
      bf:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
      c1:	39 f3                	cmp    %esi,%ebx
      c3:	72 0a                	jb     cf <peek+0x1f>
      c5:	eb 1f                	jmp    e6 <peek+0x36>
      c7:	90                   	nop
    s++;
      c8:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
      cb:	39 de                	cmp    %ebx,%esi
      cd:	76 17                	jbe    e6 <peek+0x36>
      cf:	0f be 03             	movsbl (%ebx),%eax
      d2:	c7 04 24 48 14 00 00 	movl   $0x1448,(%esp)
      d9:	89 44 24 04          	mov    %eax,0x4(%esp)
      dd:	e8 5e 0c 00 00       	call   d40 <strchr>
      e2:	85 c0                	test   %eax,%eax
      e4:	75 e2                	jne    c8 <peek+0x18>
    s++;
  *ps = s;
      e6:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
      e8:	0f b6 13             	movzbl (%ebx),%edx
      eb:	31 c0                	xor    %eax,%eax
      ed:	84 d2                	test   %dl,%dl
      ef:	75 0f                	jne    100 <peek+0x50>
}
      f1:	83 c4 1c             	add    $0x1c,%esp
      f4:	5b                   	pop    %ebx
      f5:	5e                   	pop    %esi
      f6:	5f                   	pop    %edi
      f7:	5d                   	pop    %ebp
      f8:	c3                   	ret    
      f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
     100:	8b 45 10             	mov    0x10(%ebp),%eax
     103:	0f be d2             	movsbl %dl,%edx
     106:	89 54 24 04          	mov    %edx,0x4(%esp)
     10a:	89 04 24             	mov    %eax,(%esp)
     10d:	e8 2e 0c 00 00       	call   d40 <strchr>
     112:	85 c0                	test   %eax,%eax
     114:	0f 95 c0             	setne  %al
}
     117:	83 c4 1c             	add    $0x1c,%esp

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
     11a:	0f b6 c0             	movzbl %al,%eax
}
     11d:	5b                   	pop    %ebx
     11e:	5e                   	pop    %esi
     11f:	5f                   	pop    %edi
     120:	5d                   	pop    %ebp
     121:	c3                   	ret    
     122:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	57                   	push   %edi
     134:	56                   	push   %esi
     135:	53                   	push   %ebx
     136:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     139:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     13c:	8b 75 0c             	mov    0xc(%ebp),%esi
     13f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *s;
  int ret;

  s = *ps;
     142:	8b 18                	mov    (%eax),%ebx
  while(s < es && strchr(whitespace, *s))
     144:	39 f3                	cmp    %esi,%ebx
     146:	72 0f                	jb     157 <gettoken+0x27>
     148:	eb 24                	jmp    16e <gettoken+0x3e>
     14a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     150:	83 c3 01             	add    $0x1,%ebx
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     153:	39 de                	cmp    %ebx,%esi
     155:	76 17                	jbe    16e <gettoken+0x3e>
     157:	0f be 03             	movsbl (%ebx),%eax
     15a:	c7 04 24 48 14 00 00 	movl   $0x1448,(%esp)
     161:	89 44 24 04          	mov    %eax,0x4(%esp)
     165:	e8 d6 0b 00 00       	call   d40 <strchr>
     16a:	85 c0                	test   %eax,%eax
     16c:	75 e2                	jne    150 <gettoken+0x20>
    s++;
  if(q)
     16e:	85 ff                	test   %edi,%edi
     170:	74 02                	je     174 <gettoken+0x44>
    *q = s;
     172:	89 1f                	mov    %ebx,(%edi)
  ret = *s;
     174:	0f b6 13             	movzbl (%ebx),%edx
     177:	0f be fa             	movsbl %dl,%edi
  switch(*s){
     17a:	80 fa 3c             	cmp    $0x3c,%dl
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
     17d:	89 f8                	mov    %edi,%eax
  switch(*s){
     17f:	7f 4f                	jg     1d0 <gettoken+0xa0>
     181:	80 fa 3b             	cmp    $0x3b,%dl
     184:	0f 8c 9e 00 00 00    	jl     228 <gettoken+0xf8>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     18a:	83 c3 01             	add    $0x1,%ebx
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     18d:	8b 55 14             	mov    0x14(%ebp),%edx
     190:	85 d2                	test   %edx,%edx
     192:	74 05                	je     199 <gettoken+0x69>
    *eq = s;
     194:	8b 45 14             	mov    0x14(%ebp),%eax
     197:	89 18                	mov    %ebx,(%eax)

  while(s < es && strchr(whitespace, *s))
     199:	39 f3                	cmp    %esi,%ebx
     19b:	72 0a                	jb     1a7 <gettoken+0x77>
     19d:	eb 1f                	jmp    1be <gettoken+0x8e>
     19f:	90                   	nop
    s++;
     1a0:	83 c3 01             	add    $0x1,%ebx
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     1a3:	39 de                	cmp    %ebx,%esi
     1a5:	76 17                	jbe    1be <gettoken+0x8e>
     1a7:	0f be 03             	movsbl (%ebx),%eax
     1aa:	c7 04 24 48 14 00 00 	movl   $0x1448,(%esp)
     1b1:	89 44 24 04          	mov    %eax,0x4(%esp)
     1b5:	e8 86 0b 00 00       	call   d40 <strchr>
     1ba:	85 c0                	test   %eax,%eax
     1bc:	75 e2                	jne    1a0 <gettoken+0x70>
    s++;
  *ps = s;
     1be:	8b 45 08             	mov    0x8(%ebp),%eax
     1c1:	89 18                	mov    %ebx,(%eax)
  return ret;
}
     1c3:	83 c4 1c             	add    $0x1c,%esp
     1c6:	89 f8                	mov    %edi,%eax
     1c8:	5b                   	pop    %ebx
     1c9:	5e                   	pop    %esi
     1ca:	5f                   	pop    %edi
     1cb:	5d                   	pop    %ebp
     1cc:	c3                   	ret    
     1cd:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     1d0:	80 fa 3e             	cmp    $0x3e,%dl
     1d3:	74 73                	je     248 <gettoken+0x118>
     1d5:	80 fa 7c             	cmp    $0x7c,%dl
     1d8:	74 b0                	je     18a <gettoken+0x5a>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     1da:	39 de                	cmp    %ebx,%esi
     1dc:	77 2b                	ja     209 <gettoken+0xd9>
     1de:	66 90                	xchg   %ax,%ax
     1e0:	eb 3b                	jmp    21d <gettoken+0xed>
     1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     1e8:	0f be 03             	movsbl (%ebx),%eax
     1eb:	c7 04 24 4e 14 00 00 	movl   $0x144e,(%esp)
     1f2:	89 44 24 04          	mov    %eax,0x4(%esp)
     1f6:	e8 45 0b 00 00       	call   d40 <strchr>
     1fb:	85 c0                	test   %eax,%eax
     1fd:	75 1e                	jne    21d <gettoken+0xed>
      s++;
     1ff:	83 c3 01             	add    $0x1,%ebx
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     202:	39 de                	cmp    %ebx,%esi
     204:	76 17                	jbe    21d <gettoken+0xed>
     206:	0f be 03             	movsbl (%ebx),%eax
     209:	89 44 24 04          	mov    %eax,0x4(%esp)
     20d:	c7 04 24 48 14 00 00 	movl   $0x1448,(%esp)
     214:	e8 27 0b 00 00       	call   d40 <strchr>
     219:	85 c0                	test   %eax,%eax
     21b:	74 cb                	je     1e8 <gettoken+0xb8>
     21d:	bf 61 00 00 00       	mov    $0x61,%edi
     222:	e9 66 ff ff ff       	jmp    18d <gettoken+0x5d>
     227:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     228:	80 fa 29             	cmp    $0x29,%dl
     22b:	7f ad                	jg     1da <gettoken+0xaa>
     22d:	80 fa 28             	cmp    $0x28,%dl
     230:	0f 8d 54 ff ff ff    	jge    18a <gettoken+0x5a>
     236:	84 d2                	test   %dl,%dl
     238:	0f 84 4f ff ff ff    	je     18d <gettoken+0x5d>
     23e:	80 fa 26             	cmp    $0x26,%dl
     241:	75 97                	jne    1da <gettoken+0xaa>
     243:	e9 42 ff ff ff       	jmp    18a <gettoken+0x5a>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     248:	83 c3 01             	add    $0x1,%ebx
    if(*s == '>'){
     24b:	80 3b 3e             	cmpb   $0x3e,(%ebx)
     24e:	66 90                	xchg   %ax,%ax
     250:	0f 85 37 ff ff ff    	jne    18d <gettoken+0x5d>
      ret = '+';
      s++;
     256:	83 c3 01             	add    $0x1,%ebx
     259:	bf 2b 00 00 00       	mov    $0x2b,%edi
     25e:	e9 2a ff ff ff       	jmp    18d <gettoken+0x5d>
     263:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <backcmd>:
  return (struct cmd*)cmd;
}

struct cmd*
backcmd(struct cmd *subcmd)
{
     270:	55                   	push   %ebp
     271:	89 e5                	mov    %esp,%ebp
     273:	53                   	push   %ebx
     274:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     277:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     27e:	e8 dd 0f 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     283:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     28a:	00 
     28b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     292:	00 
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     293:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     295:	89 04 24             	mov    %eax,(%esp)
     298:	e8 83 0a 00 00       	call   d20 <memset>
  cmd->type = BACK;
     29d:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     2a3:	8b 45 08             	mov    0x8(%ebp),%eax
     2a6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     2a9:	89 d8                	mov    %ebx,%eax
     2ab:	83 c4 14             	add    $0x14,%esp
     2ae:	5b                   	pop    %ebx
     2af:	5d                   	pop    %ebp
     2b0:	c3                   	ret    
     2b1:	eb 0d                	jmp    2c0 <listcmd>
     2b3:	90                   	nop
     2b4:	90                   	nop
     2b5:	90                   	nop
     2b6:	90                   	nop
     2b7:	90                   	nop
     2b8:	90                   	nop
     2b9:	90                   	nop
     2ba:	90                   	nop
     2bb:	90                   	nop
     2bc:	90                   	nop
     2bd:	90                   	nop
     2be:	90                   	nop
     2bf:	90                   	nop

000002c0 <listcmd>:
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	53                   	push   %ebx
     2c4:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2c7:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     2ce:	e8 8d 0f 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     2d3:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     2da:	00 
     2db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     2e2:	00 
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2e3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2e5:	89 04 24             	mov    %eax,(%esp)
     2e8:	e8 33 0a 00 00       	call   d20 <memset>
  cmd->type = LIST;
     2ed:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     2f3:	8b 45 08             	mov    0x8(%ebp),%eax
     2f6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     2f9:	8b 45 0c             	mov    0xc(%ebp),%eax
     2fc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     2ff:	89 d8                	mov    %ebx,%eax
     301:	83 c4 14             	add    $0x14,%esp
     304:	5b                   	pop    %ebx
     305:	5d                   	pop    %ebp
     306:	c3                   	ret    
     307:	89 f6                	mov    %esi,%esi
     309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <pipecmd>:
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	53                   	push   %ebx
     314:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     317:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     31e:	e8 3d 0f 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     323:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     32a:	00 
     32b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     332:	00 
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     333:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     335:	89 04 24             	mov    %eax,(%esp)
     338:	e8 e3 09 00 00       	call   d20 <memset>
  cmd->type = PIPE;
     33d:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     343:	8b 45 08             	mov    0x8(%ebp),%eax
     346:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     349:	8b 45 0c             	mov    0xc(%ebp),%eax
     34c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     34f:	89 d8                	mov    %ebx,%eax
     351:	83 c4 14             	add    $0x14,%esp
     354:	5b                   	pop    %ebx
     355:	5d                   	pop    %ebp
     356:	c3                   	ret    
     357:	89 f6                	mov    %esi,%esi
     359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <redircmd>:
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	53                   	push   %ebx
     364:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     367:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     36e:	e8 ed 0e 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     373:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     37a:	00 
     37b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     382:	00 
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     383:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     385:	89 04 24             	mov    %eax,(%esp)
     388:	e8 93 09 00 00       	call   d20 <memset>
  cmd->type = REDIR;
     38d:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     393:	8b 45 08             	mov    0x8(%ebp),%eax
     396:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     399:	8b 45 0c             	mov    0xc(%ebp),%eax
     39c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     39f:	8b 45 10             	mov    0x10(%ebp),%eax
     3a2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3a5:	8b 45 14             	mov    0x14(%ebp),%eax
     3a8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3ab:	8b 45 18             	mov    0x18(%ebp),%eax
     3ae:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3b1:	89 d8                	mov    %ebx,%eax
     3b3:	83 c4 14             	add    $0x14,%esp
     3b6:	5b                   	pop    %ebx
     3b7:	5d                   	pop    %ebp
     3b8:	c3                   	ret    
     3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	53                   	push   %ebx
     3c4:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c7:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     3ce:	e8 8d 0e 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3d3:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     3da:	00 
     3db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3e2:	00 
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3e5:	89 04 24             	mov    %eax,(%esp)
     3e8:	e8 33 09 00 00       	call   d20 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     3ed:	89 d8                	mov    %ebx,%eax
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
     3ef:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     3f5:	83 c4 14             	add    $0x14,%esp
     3f8:	5b                   	pop    %ebx
     3f9:	5d                   	pop    %ebp
     3fa:	c3                   	ret    
     3fb:	90                   	nop
     3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000400 <panic>:
  exit(0);
}

void
panic(char *s)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     406:	8b 45 08             	mov    0x8(%ebp),%eax
     409:	c7 44 24 04 e1 13 00 	movl   $0x13e1,0x4(%esp)
     410:	00 
     411:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     418:	89 44 24 08          	mov    %eax,0x8(%esp)
     41c:	e8 bf 0b 00 00       	call   fe0 <printf>
  exit(0);
     421:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     428:	e8 7b 0a 00 00       	call   ea8 <exit>
     42d:	8d 76 00             	lea    0x0(%esi),%esi

00000430 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     430:	55                   	push   %ebp
     431:	89 e5                	mov    %esp,%ebp
     433:	57                   	push   %edi
     434:	56                   	push   %esi
     435:	53                   	push   %ebx
     436:	83 ec 3c             	sub    $0x3c,%esp
     439:	8b 7d 0c             	mov    0xc(%ebp),%edi
     43c:	8b 75 10             	mov    0x10(%ebp),%esi
     43f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     440:	c7 44 24 08 95 13 00 	movl   $0x1395,0x8(%esp)
     447:	00 
     448:	89 74 24 04          	mov    %esi,0x4(%esp)
     44c:	89 3c 24             	mov    %edi,(%esp)
     44f:	e8 5c fc ff ff       	call   b0 <peek>
     454:	85 c0                	test   %eax,%eax
     456:	0f 84 a4 00 00 00    	je     500 <parseredirs+0xd0>
    tok = gettoken(ps, es, 0, 0);
     45c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     463:	00 
     464:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     46b:	00 
     46c:	89 74 24 04          	mov    %esi,0x4(%esp)
     470:	89 3c 24             	mov    %edi,(%esp)
     473:	e8 b8 fc ff ff       	call   130 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     478:	89 74 24 04          	mov    %esi,0x4(%esp)
     47c:	89 3c 24             	mov    %edi,(%esp)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
     47f:	89 c3                	mov    %eax,%ebx
    if(gettoken(ps, es, &q, &eq) != 'a')
     481:	8d 45 e0             	lea    -0x20(%ebp),%eax
     484:	89 44 24 0c          	mov    %eax,0xc(%esp)
     488:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     48b:	89 44 24 08          	mov    %eax,0x8(%esp)
     48f:	e8 9c fc ff ff       	call   130 <gettoken>
     494:	83 f8 61             	cmp    $0x61,%eax
     497:	74 0c                	je     4a5 <parseredirs+0x75>
      panic("missing file for redirection");
     499:	c7 04 24 78 13 00 00 	movl   $0x1378,(%esp)
     4a0:	e8 5b ff ff ff       	call   400 <panic>
    switch(tok){
     4a5:	83 fb 3c             	cmp    $0x3c,%ebx
     4a8:	74 3e                	je     4e8 <parseredirs+0xb8>
     4aa:	83 fb 3e             	cmp    $0x3e,%ebx
     4ad:	74 05                	je     4b4 <parseredirs+0x84>
     4af:	83 fb 2b             	cmp    $0x2b,%ebx
     4b2:	75 8c                	jne    440 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     4b4:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     4bb:	00 
     4bc:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     4c3:	00 
     4c4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     4c7:	89 44 24 08          	mov    %eax,0x8(%esp)
     4cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     4ce:	89 44 24 04          	mov    %eax,0x4(%esp)
     4d2:	8b 45 08             	mov    0x8(%ebp),%eax
     4d5:	89 04 24             	mov    %eax,(%esp)
     4d8:	e8 83 fe ff ff       	call   360 <redircmd>
     4dd:	89 45 08             	mov    %eax,0x8(%ebp)
     4e0:	e9 5b ff ff ff       	jmp    440 <parseredirs+0x10>
     4e5:	8d 76 00             	lea    0x0(%esi),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     4e8:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     4ef:	00 
     4f0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     4f7:	00 
     4f8:	eb ca                	jmp    4c4 <parseredirs+0x94>
     4fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     500:	8b 45 08             	mov    0x8(%ebp),%eax
     503:	83 c4 3c             	add    $0x3c,%esp
     506:	5b                   	pop    %ebx
     507:	5e                   	pop    %esi
     508:	5f                   	pop    %edi
     509:	5d                   	pop    %ebp
     50a:	c3                   	ret    
     50b:	90                   	nop
     50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000510 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     510:	55                   	push   %ebp
     511:	89 e5                	mov    %esp,%ebp
     513:	57                   	push   %edi
     514:	56                   	push   %esi
     515:	53                   	push   %ebx
     516:	83 ec 3c             	sub    $0x3c,%esp
     519:	8b 75 08             	mov    0x8(%ebp),%esi
     51c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     51f:	c7 44 24 08 98 13 00 	movl   $0x1398,0x8(%esp)
     526:	00 
     527:	89 34 24             	mov    %esi,(%esp)
     52a:	89 7c 24 04          	mov    %edi,0x4(%esp)
     52e:	e8 7d fb ff ff       	call   b0 <peek>
     533:	85 c0                	test   %eax,%eax
     535:	0f 85 cd 00 00 00    	jne    608 <parseexec+0xf8>
    return parseblock(ps, es);

  ret = execcmd();
     53b:	e8 80 fe ff ff       	call   3c0 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     540:	31 db                	xor    %ebx,%ebx
     542:	89 7c 24 08          	mov    %edi,0x8(%esp)
     546:	89 74 24 04          	mov    %esi,0x4(%esp)
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     54a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     54d:	89 04 24             	mov    %eax,(%esp)
     550:	e8 db fe ff ff       	call   430 <parseredirs>
     555:	89 45 d0             	mov    %eax,-0x30(%ebp)
  while(!peek(ps, es, "|)&;")){
     558:	eb 1c                	jmp    576 <parseexec+0x66>
     55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     560:	8b 45 d0             	mov    -0x30(%ebp),%eax
     563:	89 7c 24 08          	mov    %edi,0x8(%esp)
     567:	89 74 24 04          	mov    %esi,0x4(%esp)
     56b:	89 04 24             	mov    %eax,(%esp)
     56e:	e8 bd fe ff ff       	call   430 <parseredirs>
     573:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     576:	c7 44 24 08 af 13 00 	movl   $0x13af,0x8(%esp)
     57d:	00 
     57e:	89 7c 24 04          	mov    %edi,0x4(%esp)
     582:	89 34 24             	mov    %esi,(%esp)
     585:	e8 26 fb ff ff       	call   b0 <peek>
     58a:	85 c0                	test   %eax,%eax
     58c:	75 5a                	jne    5e8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     58e:	8d 45 e0             	lea    -0x20(%ebp),%eax
     591:	8d 55 e4             	lea    -0x1c(%ebp),%edx
     594:	89 44 24 0c          	mov    %eax,0xc(%esp)
     598:	89 54 24 08          	mov    %edx,0x8(%esp)
     59c:	89 7c 24 04          	mov    %edi,0x4(%esp)
     5a0:	89 34 24             	mov    %esi,(%esp)
     5a3:	e8 88 fb ff ff       	call   130 <gettoken>
     5a8:	85 c0                	test   %eax,%eax
     5aa:	74 3c                	je     5e8 <parseexec+0xd8>
      break;
    if(tok != 'a')
     5ac:	83 f8 61             	cmp    $0x61,%eax
     5af:	74 0c                	je     5bd <parseexec+0xad>
      panic("syntax");
     5b1:	c7 04 24 9a 13 00 00 	movl   $0x139a,(%esp)
     5b8:	e8 43 fe ff ff       	call   400 <panic>
    cmd->argv[argc] = q;
     5bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     5c0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     5c3:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     5c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
     5ca:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     5ce:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     5d1:	83 fb 09             	cmp    $0x9,%ebx
     5d4:	7e 8a                	jle    560 <parseexec+0x50>
      panic("too many args");
     5d6:	c7 04 24 a1 13 00 00 	movl   $0x13a1,(%esp)
     5dd:	e8 1e fe ff ff       	call   400 <panic>
     5e2:	e9 79 ff ff ff       	jmp    560 <parseexec+0x50>
     5e7:	90                   	nop
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     5e8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     5eb:	c7 44 9a 04 00 00 00 	movl   $0x0,0x4(%edx,%ebx,4)
     5f2:	00 
  cmd->eargv[argc] = 0;
     5f3:	c7 44 9a 2c 00 00 00 	movl   $0x0,0x2c(%edx,%ebx,4)
     5fa:	00 
  return ret;
}
     5fb:	8b 45 d0             	mov    -0x30(%ebp),%eax
     5fe:	83 c4 3c             	add    $0x3c,%esp
     601:	5b                   	pop    %ebx
     602:	5e                   	pop    %esi
     603:	5f                   	pop    %edi
     604:	5d                   	pop    %ebp
     605:	c3                   	ret    
     606:	66 90                	xchg   %ax,%ax
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     608:	89 7c 24 04          	mov    %edi,0x4(%esp)
     60c:	89 34 24             	mov    %esi,(%esp)
     60f:	e8 6c 01 00 00       	call   780 <parseblock>
     614:	89 45 d0             	mov    %eax,-0x30(%ebp)
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     617:	8b 45 d0             	mov    -0x30(%ebp),%eax
     61a:	83 c4 3c             	add    $0x3c,%esp
     61d:	5b                   	pop    %ebx
     61e:	5e                   	pop    %esi
     61f:	5f                   	pop    %edi
     620:	5d                   	pop    %ebp
     621:	c3                   	ret    
     622:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000630 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	83 ec 28             	sub    $0x28,%esp
     636:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     639:	8b 5d 08             	mov    0x8(%ebp),%ebx
     63c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     63f:	8b 75 0c             	mov    0xc(%ebp),%esi
     642:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     645:	89 1c 24             	mov    %ebx,(%esp)
     648:	89 74 24 04          	mov    %esi,0x4(%esp)
     64c:	e8 bf fe ff ff       	call   510 <parseexec>
  if(peek(ps, es, "|")){
     651:	c7 44 24 08 b4 13 00 	movl   $0x13b4,0x8(%esp)
     658:	00 
     659:	89 74 24 04          	mov    %esi,0x4(%esp)
     65d:	89 1c 24             	mov    %ebx,(%esp)
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     660:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     662:	e8 49 fa ff ff       	call   b0 <peek>
     667:	85 c0                	test   %eax,%eax
     669:	75 15                	jne    680 <parsepipe+0x50>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     66b:	89 f8                	mov    %edi,%eax
     66d:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     670:	8b 75 f8             	mov    -0x8(%ebp),%esi
     673:	8b 7d fc             	mov    -0x4(%ebp),%edi
     676:	89 ec                	mov    %ebp,%esp
     678:	5d                   	pop    %ebp
     679:	c3                   	ret    
     67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     680:	89 74 24 04          	mov    %esi,0x4(%esp)
     684:	89 1c 24             	mov    %ebx,(%esp)
     687:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     68e:	00 
     68f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     696:	00 
     697:	e8 94 fa ff ff       	call   130 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     69c:	89 74 24 04          	mov    %esi,0x4(%esp)
     6a0:	89 1c 24             	mov    %ebx,(%esp)
     6a3:	e8 88 ff ff ff       	call   630 <parsepipe>
  }
  return cmd;
}
     6a8:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6ab:	89 7d 08             	mov    %edi,0x8(%ebp)
  }
  return cmd;
}
     6ae:	8b 75 f8             	mov    -0x8(%ebp),%esi
     6b1:	8b 7d fc             	mov    -0x4(%ebp),%edi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6b4:	89 45 0c             	mov    %eax,0xc(%ebp)
  }
  return cmd;
}
     6b7:	89 ec                	mov    %ebp,%esp
     6b9:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6ba:	e9 51 fc ff ff       	jmp    310 <pipecmd>
     6bf:	90                   	nop

000006c0 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     6c0:	55                   	push   %ebp
     6c1:	89 e5                	mov    %esp,%ebp
     6c3:	57                   	push   %edi
     6c4:	56                   	push   %esi
     6c5:	53                   	push   %ebx
     6c6:	83 ec 1c             	sub    $0x1c,%esp
     6c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     6cc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     6cf:	89 1c 24             	mov    %ebx,(%esp)
     6d2:	89 74 24 04          	mov    %esi,0x4(%esp)
     6d6:	e8 55 ff ff ff       	call   630 <parsepipe>
     6db:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     6dd:	eb 27                	jmp    706 <parseline+0x46>
     6df:	90                   	nop
    gettoken(ps, es, 0, 0);
     6e0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     6e7:	00 
     6e8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     6ef:	00 
     6f0:	89 74 24 04          	mov    %esi,0x4(%esp)
     6f4:	89 1c 24             	mov    %ebx,(%esp)
     6f7:	e8 34 fa ff ff       	call   130 <gettoken>
    cmd = backcmd(cmd);
     6fc:	89 3c 24             	mov    %edi,(%esp)
     6ff:	e8 6c fb ff ff       	call   270 <backcmd>
     704:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     706:	c7 44 24 08 b6 13 00 	movl   $0x13b6,0x8(%esp)
     70d:	00 
     70e:	89 74 24 04          	mov    %esi,0x4(%esp)
     712:	89 1c 24             	mov    %ebx,(%esp)
     715:	e8 96 f9 ff ff       	call   b0 <peek>
     71a:	85 c0                	test   %eax,%eax
     71c:	75 c2                	jne    6e0 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     71e:	c7 44 24 08 b2 13 00 	movl   $0x13b2,0x8(%esp)
     725:	00 
     726:	89 74 24 04          	mov    %esi,0x4(%esp)
     72a:	89 1c 24             	mov    %ebx,(%esp)
     72d:	e8 7e f9 ff ff       	call   b0 <peek>
     732:	85 c0                	test   %eax,%eax
     734:	75 0a                	jne    740 <parseline+0x80>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     736:	83 c4 1c             	add    $0x1c,%esp
     739:	89 f8                	mov    %edi,%eax
     73b:	5b                   	pop    %ebx
     73c:	5e                   	pop    %esi
     73d:	5f                   	pop    %edi
     73e:	5d                   	pop    %ebp
     73f:	c3                   	ret    
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     740:	89 74 24 04          	mov    %esi,0x4(%esp)
     744:	89 1c 24             	mov    %ebx,(%esp)
     747:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     74e:	00 
     74f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     756:	00 
     757:	e8 d4 f9 ff ff       	call   130 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     75c:	89 74 24 04          	mov    %esi,0x4(%esp)
     760:	89 1c 24             	mov    %ebx,(%esp)
     763:	e8 58 ff ff ff       	call   6c0 <parseline>
     768:	89 7d 08             	mov    %edi,0x8(%ebp)
     76b:	89 45 0c             	mov    %eax,0xc(%ebp)
  }
  return cmd;
}
     76e:	83 c4 1c             	add    $0x1c,%esp
     771:	5b                   	pop    %ebx
     772:	5e                   	pop    %esi
     773:	5f                   	pop    %edi
     774:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     775:	e9 46 fb ff ff       	jmp    2c0 <listcmd>
     77a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000780 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     780:	55                   	push   %ebp
     781:	89 e5                	mov    %esp,%ebp
     783:	83 ec 28             	sub    $0x28,%esp
     786:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     789:	8b 5d 08             	mov    0x8(%ebp),%ebx
     78c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     78f:	8b 75 0c             	mov    0xc(%ebp),%esi
     792:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     795:	c7 44 24 08 98 13 00 	movl   $0x1398,0x8(%esp)
     79c:	00 
     79d:	89 1c 24             	mov    %ebx,(%esp)
     7a0:	89 74 24 04          	mov    %esi,0x4(%esp)
     7a4:	e8 07 f9 ff ff       	call   b0 <peek>
     7a9:	85 c0                	test   %eax,%eax
     7ab:	0f 84 87 00 00 00    	je     838 <parseblock+0xb8>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     7b1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     7b8:	00 
     7b9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     7c0:	00 
     7c1:	89 74 24 04          	mov    %esi,0x4(%esp)
     7c5:	89 1c 24             	mov    %ebx,(%esp)
     7c8:	e8 63 f9 ff ff       	call   130 <gettoken>
  cmd = parseline(ps, es);
     7cd:	89 74 24 04          	mov    %esi,0x4(%esp)
     7d1:	89 1c 24             	mov    %ebx,(%esp)
     7d4:	e8 e7 fe ff ff       	call   6c0 <parseline>
  if(!peek(ps, es, ")"))
     7d9:	c7 44 24 08 d4 13 00 	movl   $0x13d4,0x8(%esp)
     7e0:	00 
     7e1:	89 74 24 04          	mov    %esi,0x4(%esp)
     7e5:	89 1c 24             	mov    %ebx,(%esp)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     7e8:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     7ea:	e8 c1 f8 ff ff       	call   b0 <peek>
     7ef:	85 c0                	test   %eax,%eax
     7f1:	75 0c                	jne    7ff <parseblock+0x7f>
    panic("syntax - missing )");
     7f3:	c7 04 24 c3 13 00 00 	movl   $0x13c3,(%esp)
     7fa:	e8 01 fc ff ff       	call   400 <panic>
  gettoken(ps, es, 0, 0);
     7ff:	89 74 24 04          	mov    %esi,0x4(%esp)
     803:	89 1c 24             	mov    %ebx,(%esp)
     806:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     80d:	00 
     80e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     815:	00 
     816:	e8 15 f9 ff ff       	call   130 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     81b:	89 74 24 08          	mov    %esi,0x8(%esp)
     81f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     823:	89 3c 24             	mov    %edi,(%esp)
     826:	e8 05 fc ff ff       	call   430 <parseredirs>
  return cmd;
}
     82b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     82e:	8b 75 f8             	mov    -0x8(%ebp),%esi
     831:	8b 7d fc             	mov    -0x4(%ebp),%edi
     834:	89 ec                	mov    %ebp,%esp
     836:	5d                   	pop    %ebp
     837:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     838:	c7 04 24 b8 13 00 00 	movl   $0x13b8,(%esp)
     83f:	e8 bc fb ff ff       	call   400 <panic>
     844:	e9 68 ff ff ff       	jmp    7b1 <parseblock+0x31>
     849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000850 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     850:	55                   	push   %ebp
     851:	89 e5                	mov    %esp,%ebp
     853:	56                   	push   %esi
     854:	53                   	push   %ebx
     855:	83 ec 10             	sub    $0x10,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     858:	8b 5d 08             	mov    0x8(%ebp),%ebx
     85b:	89 1c 24             	mov    %ebx,(%esp)
     85e:	e8 9d 04 00 00       	call   d00 <strlen>
     863:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     865:	8d 45 08             	lea    0x8(%ebp),%eax
     868:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     86c:	89 04 24             	mov    %eax,(%esp)
     86f:	e8 4c fe ff ff       	call   6c0 <parseline>
  peek(&s, es, "");
     874:	c7 44 24 08 03 14 00 	movl   $0x1403,0x8(%esp)
     87b:	00 
     87c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
     880:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     882:	8d 45 08             	lea    0x8(%ebp),%eax
     885:	89 04 24             	mov    %eax,(%esp)
     888:	e8 23 f8 ff ff       	call   b0 <peek>
  if(s != es){
     88d:	8b 45 08             	mov    0x8(%ebp),%eax
     890:	39 d8                	cmp    %ebx,%eax
     892:	74 24                	je     8b8 <parsecmd+0x68>
    printf(2, "leftovers: %s\n", s);
     894:	89 44 24 08          	mov    %eax,0x8(%esp)
     898:	c7 44 24 04 d6 13 00 	movl   $0x13d6,0x4(%esp)
     89f:	00 
     8a0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     8a7:	e8 34 07 00 00       	call   fe0 <printf>
    panic("syntax");
     8ac:	c7 04 24 9a 13 00 00 	movl   $0x139a,(%esp)
     8b3:	e8 48 fb ff ff       	call   400 <panic>
  }
  nulterminate(cmd);
     8b8:	89 34 24             	mov    %esi,(%esp)
     8bb:	e8 40 f7 ff ff       	call   0 <nulterminate>
  return cmd;
}
     8c0:	83 c4 10             	add    $0x10,%esp
     8c3:	89 f0                	mov    %esi,%eax
     8c5:	5b                   	pop    %ebx
     8c6:	5e                   	pop    %esi
     8c7:	5d                   	pop    %ebp
     8c8:	c3                   	ret    
     8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008d0 <fork1>:
  exit(0);
}

int
fork1(void)
{
     8d0:	55                   	push   %ebp
     8d1:	89 e5                	mov    %esp,%ebp
     8d3:	83 ec 28             	sub    $0x28,%esp
  int pid;

  pid = fork();
     8d6:	e8 c5 05 00 00       	call   ea0 <fork>
  if(pid == -1)
     8db:	83 f8 ff             	cmp    $0xffffffff,%eax
     8de:	74 08                	je     8e8 <fork1+0x18>
    panic("fork");
  return pid;
}
     8e0:	c9                   	leave  
     8e1:	c3                   	ret    
     8e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     8e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
     8eb:	c7 04 24 e5 13 00 00 	movl   $0x13e5,(%esp)
     8f2:	e8 09 fb ff ff       	call   400 <panic>
     8f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  return pid;
}
     8fa:	c9                   	leave  
     8fb:	c3                   	ret    
     8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000900 <getcmd>:
  exit(0);
}

int
getcmd(char *buf, int nbuf)
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	83 ec 18             	sub    $0x18,%esp
     906:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     909:	8b 5d 08             	mov    0x8(%ebp),%ebx
     90c:	89 75 fc             	mov    %esi,-0x4(%ebp)
     90f:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     912:	c7 44 24 04 ea 13 00 	movl   $0x13ea,0x4(%esp)
     919:	00 
     91a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     921:	e8 ba 06 00 00       	call   fe0 <printf>
  memset(buf, 0, nbuf);
     926:	89 74 24 08          	mov    %esi,0x8(%esp)
     92a:	89 1c 24             	mov    %ebx,(%esp)
     92d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     934:	00 
     935:	e8 e6 03 00 00       	call   d20 <memset>
  gets(buf, nbuf);
     93a:	89 74 24 04          	mov    %esi,0x4(%esp)
     93e:	89 1c 24             	mov    %ebx,(%esp)
     941:	e8 fa 04 00 00       	call   e40 <gets>
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
     946:	8b 75 fc             	mov    -0x4(%ebp),%esi
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
     949:	80 3b 01             	cmpb   $0x1,(%ebx)
    return -1;
  return 0;
}
     94c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
     94f:	19 c0                	sbb    %eax,%eax
    return -1;
  return 0;
}
     951:	89 ec                	mov    %ebp,%esp
     953:	5d                   	pop    %ebp
     954:	c3                   	ret    
     955:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000960 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	53                   	push   %ebx
     964:	83 ec 24             	sub    $0x24,%esp
     967:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     96a:	85 db                	test   %ebx,%ebx
     96c:	74 42                	je     9b0 <runcmd+0x50>
    exit(0);

  switch(cmd->type){
     96e:	83 3b 05             	cmpl   $0x5,(%ebx)
     971:	76 4d                	jbe    9c0 <runcmd+0x60>
  default:
    panic("runcmd");
     973:	c7 04 24 ed 13 00 00 	movl   $0x13ed,(%esp)
     97a:	e8 81 fa ff ff       	call   400 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     97f:	8b 43 04             	mov    0x4(%ebx),%eax
     982:	85 c0                	test   %eax,%eax
     984:	74 2a                	je     9b0 <runcmd+0x50>
      exit(0);
    exec(ecmd->argv[0], ecmd->argv);
     986:	8d 53 04             	lea    0x4(%ebx),%edx
     989:	89 54 24 04          	mov    %edx,0x4(%esp)
     98d:	89 04 24             	mov    %eax,(%esp)
     990:	e8 4b 05 00 00       	call   ee0 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     995:	8b 43 04             	mov    0x4(%ebx),%eax
     998:	c7 44 24 04 f4 13 00 	movl   $0x13f4,0x4(%esp)
     99f:	00 
     9a0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     9a7:	89 44 24 08          	mov    %eax,0x8(%esp)
     9ab:	e8 30 06 00 00       	call   fe0 <printf>
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit(0);
     9b0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     9b7:	e8 ec 04 00 00       	call   ea8 <exit>
     9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct redircmd *rcmd;

  if(cmd == 0)
    exit(0);

  switch(cmd->type){
     9c0:	8b 03                	mov    (%ebx),%eax
     9c2:	ff 24 85 60 13 00 00 	jmp    *0x1360(,%eax,4)
     9c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     9d0:	e8 fb fe ff ff       	call   8d0 <fork1>
     9d5:	85 c0                	test   %eax,%eax
     9d7:	0f 84 c0 00 00 00    	je     a9d <runcmd+0x13d>
      runcmd(bcmd->cmd);
    break;
  }
  exit(0);
     9dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     9e4:	e8 bf 04 00 00       	call   ea8 <exit>
     9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     9f0:	e8 db fe ff ff       	call   8d0 <fork1>
     9f5:	85 c0                	test   %eax,%eax
     9f7:	0f 84 bb 00 00 00    	je     ab8 <runcmd+0x158>
     9fd:	8d 76 00             	lea    0x0(%esi),%esi
      runcmd(lcmd->left);
    wait();
     a00:	e8 ab 04 00 00       	call   eb0 <wait>
    runcmd(lcmd->right);
     a05:	8b 43 08             	mov    0x8(%ebx),%eax
     a08:	89 04 24             	mov    %eax,(%esp)
     a0b:	e8 50 ff ff ff       	call   960 <runcmd>
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit(0);
     a10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a17:	e8 8c 04 00 00       	call   ea8 <exit>
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     a20:	8d 45 f0             	lea    -0x10(%ebp),%eax
     a23:	89 04 24             	mov    %eax,(%esp)
     a26:	e8 8d 04 00 00       	call   eb8 <pipe>
     a2b:	85 c0                	test   %eax,%eax
     a2d:	0f 88 3d 01 00 00    	js     b70 <runcmd+0x210>
      panic("pipe");
    if(fork1() == 0){
     a33:	e8 98 fe ff ff       	call   8d0 <fork1>
     a38:	85 c0                	test   %eax,%eax
     a3a:	0f 84 c8 00 00 00    	je     b08 <runcmd+0x1a8>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     a40:	e8 8b fe ff ff       	call   8d0 <fork1>
     a45:	85 c0                	test   %eax,%eax
     a47:	74 7f                	je     ac8 <runcmd+0x168>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     a49:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a4c:	89 04 24             	mov    %eax,(%esp)
     a4f:	e8 7c 04 00 00       	call   ed0 <close>
    close(p[1]);
     a54:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a57:	89 04 24             	mov    %eax,(%esp)
     a5a:	e8 71 04 00 00       	call   ed0 <close>
    wait();
     a5f:	e8 4c 04 00 00       	call   eb0 <wait>
    wait();
     a64:	e8 47 04 00 00       	call   eb0 <wait>
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit(0);
     a69:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a70:	e8 33 04 00 00       	call   ea8 <exit>
     a75:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     a78:	8b 43 14             	mov    0x14(%ebx),%eax
     a7b:	89 04 24             	mov    %eax,(%esp)
     a7e:	e8 4d 04 00 00       	call   ed0 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     a83:	8b 43 10             	mov    0x10(%ebx),%eax
     a86:	89 44 24 04          	mov    %eax,0x4(%esp)
     a8a:	8b 43 08             	mov    0x8(%ebx),%eax
     a8d:	89 04 24             	mov    %eax,(%esp)
     a90:	e8 53 04 00 00       	call   ee8 <open>
     a95:	85 c0                	test   %eax,%eax
     a97:	0f 88 ab 00 00 00    	js     b48 <runcmd+0x1e8>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     a9d:	8b 43 04             	mov    0x4(%ebx),%eax
     aa0:	89 04 24             	mov    %eax,(%esp)
     aa3:	e8 b8 fe ff ff       	call   960 <runcmd>
    break;
  }
  exit(0);
     aa8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     aaf:	e8 f4 03 00 00       	call   ea8 <exit>
     ab4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
      runcmd(lcmd->left);
     ab8:	8b 43 04             	mov    0x4(%ebx),%eax
     abb:	89 04 24             	mov    %eax,(%esp)
     abe:	e8 9d fe ff ff       	call   960 <runcmd>
     ac3:	e9 35 ff ff ff       	jmp    9fd <runcmd+0x9d>
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
     ac8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     acf:	e8 fc 03 00 00       	call   ed0 <close>
      dup(p[0]);
     ad4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ad7:	89 04 24             	mov    %eax,(%esp)
     ada:	e8 41 04 00 00       	call   f20 <dup>
      close(p[0]);
     adf:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ae2:	89 04 24             	mov    %eax,(%esp)
     ae5:	e8 e6 03 00 00       	call   ed0 <close>
      close(p[1]);
     aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
     aed:	89 04 24             	mov    %eax,(%esp)
     af0:	e8 db 03 00 00       	call   ed0 <close>
      runcmd(pcmd->right);
     af5:	8b 43 08             	mov    0x8(%ebx),%eax
     af8:	89 04 24             	mov    %eax,(%esp)
     afb:	e8 60 fe ff ff       	call   960 <runcmd>
     b00:	e9 44 ff ff ff       	jmp    a49 <runcmd+0xe9>
     b05:	8d 76 00             	lea    0x0(%esi),%esi
  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
     b08:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b0f:	e8 bc 03 00 00       	call   ed0 <close>
      dup(p[1]);
     b14:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b17:	89 04 24             	mov    %eax,(%esp)
     b1a:	e8 01 04 00 00       	call   f20 <dup>
      close(p[0]);
     b1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b22:	89 04 24             	mov    %eax,(%esp)
     b25:	e8 a6 03 00 00       	call   ed0 <close>
      close(p[1]);
     b2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b2d:	89 04 24             	mov    %eax,(%esp)
     b30:	e8 9b 03 00 00       	call   ed0 <close>
      runcmd(pcmd->left);
     b35:	8b 43 04             	mov    0x4(%ebx),%eax
     b38:	89 04 24             	mov    %eax,(%esp)
     b3b:	e8 20 fe ff ff       	call   960 <runcmd>
     b40:	e9 fb fe ff ff       	jmp    a40 <runcmd+0xe0>
     b45:	8d 76 00             	lea    0x0(%esi),%esi

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     b48:	8b 43 08             	mov    0x8(%ebx),%eax
     b4b:	c7 44 24 04 04 14 00 	movl   $0x1404,0x4(%esp)
     b52:	00 
     b53:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     b5a:	89 44 24 08          	mov    %eax,0x8(%esp)
     b5e:	e8 7d 04 00 00       	call   fe0 <printf>
      exit(0);
     b63:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b6a:	e8 39 03 00 00       	call   ea8 <exit>
     b6f:	90                   	nop
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     b70:	c7 04 24 14 14 00 00 	movl   $0x1414,(%esp)
     b77:	e8 84 f8 ff ff       	call   400 <panic>
     b7c:	e9 b2 fe ff ff       	jmp    a33 <runcmd+0xd3>
     b81:	eb 0d                	jmp    b90 <main>
     b83:	90                   	nop
     b84:	90                   	nop
     b85:	90                   	nop
     b86:	90                   	nop
     b87:	90                   	nop
     b88:	90                   	nop
     b89:	90                   	nop
     b8a:	90                   	nop
     b8b:	90                   	nop
     b8c:	90                   	nop
     b8d:	90                   	nop
     b8e:	90                   	nop
     b8f:	90                   	nop

00000b90 <main>:
  return 0;
}

int
main(void)
{
     b90:	55                   	push   %ebp
     b91:	89 e5                	mov    %esp,%ebp
     b93:	83 e4 f0             	and    $0xfffffff0,%esp
     b96:	83 ec 10             	sub    $0x10,%esp
     b99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
     ba0:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     ba7:	00 
     ba8:	c7 04 24 19 14 00 00 	movl   $0x1419,(%esp)
     baf:	e8 34 03 00 00       	call   ee8 <open>
     bb4:	85 c0                	test   %eax,%eax
     bb6:	78 28                	js     be0 <main+0x50>
    if(fd >= 3){
     bb8:	83 f8 02             	cmp    $0x2,%eax
     bbb:	7e e3                	jle    ba0 <main+0x10>
      close(fd);
     bbd:	89 04 24             	mov    %eax,(%esp)
     bc0:	e8 0b 03 00 00       	call   ed0 <close>
      break;
     bc5:	eb 19                	jmp    be0 <main+0x50>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
     bc7:	c7 04 24 60 14 00 00 	movl   $0x1460,(%esp)
     bce:	e8 7d fc ff ff       	call   850 <parsecmd>
     bd3:	89 04 24             	mov    %eax,(%esp)
     bd6:	e8 85 fd ff ff       	call   960 <runcmd>
    wait();
     bdb:	e8 d0 02 00 00       	call   eb0 <wait>
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     be0:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
     be7:	00 
     be8:	c7 04 24 60 14 00 00 	movl   $0x1460,(%esp)
     bef:	e8 0c fd ff ff       	call   900 <getcmd>
     bf4:	85 c0                	test   %eax,%eax
     bf6:	78 70                	js     c68 <main+0xd8>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     bf8:	80 3d 60 14 00 00 63 	cmpb   $0x63,0x1460
     bff:	75 09                	jne    c0a <main+0x7a>
     c01:	80 3d 61 14 00 00 64 	cmpb   $0x64,0x1461
     c08:	74 0e                	je     c18 <main+0x88>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
     c0a:	e8 c1 fc ff ff       	call   8d0 <fork1>
     c0f:	85 c0                	test   %eax,%eax
     c11:	75 c8                	jne    bdb <main+0x4b>
     c13:	eb b2                	jmp    bc7 <main+0x37>
     c15:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     c18:	80 3d 62 14 00 00 20 	cmpb   $0x20,0x1462
     c1f:	90                   	nop
     c20:	75 e8                	jne    c0a <main+0x7a>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     c22:	c7 04 24 60 14 00 00 	movl   $0x1460,(%esp)
     c29:	e8 d2 00 00 00       	call   d00 <strlen>
      if(chdir(buf+3) < 0)
     c2e:	c7 04 24 63 14 00 00 	movl   $0x1463,(%esp)

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     c35:	c6 80 5f 14 00 00 00 	movb   $0x0,0x145f(%eax)
      if(chdir(buf+3) < 0)
     c3c:	e8 d7 02 00 00       	call   f18 <chdir>
     c41:	85 c0                	test   %eax,%eax
     c43:	79 9b                	jns    be0 <main+0x50>
        printf(2, "cannot cd %s\n", buf+3);
     c45:	c7 44 24 08 63 14 00 	movl   $0x1463,0x8(%esp)
     c4c:	00 
     c4d:	c7 44 24 04 21 14 00 	movl   $0x1421,0x4(%esp)
     c54:	00 
     c55:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     c5c:	e8 7f 03 00 00       	call   fe0 <printf>
     c61:	e9 7a ff ff ff       	jmp    be0 <main+0x50>
     c66:	66 90                	xchg   %ax,%ax
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit(0);
     c68:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c6f:	e8 34 02 00 00       	call   ea8 <exit>
     c74:	90                   	nop
     c75:	90                   	nop
     c76:	90                   	nop
     c77:	90                   	nop
     c78:	90                   	nop
     c79:	90                   	nop
     c7a:	90                   	nop
     c7b:	90                   	nop
     c7c:	90                   	nop
     c7d:	90                   	nop
     c7e:	90                   	nop
     c7f:	90                   	nop

00000c80 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     c80:	55                   	push   %ebp
     c81:	31 d2                	xor    %edx,%edx
     c83:	89 e5                	mov    %esp,%ebp
     c85:	8b 45 08             	mov    0x8(%ebp),%eax
     c88:	53                   	push   %ebx
     c89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     c90:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
     c94:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     c97:	83 c2 01             	add    $0x1,%edx
     c9a:	84 c9                	test   %cl,%cl
     c9c:	75 f2                	jne    c90 <strcpy+0x10>
    ;
  return os;
}
     c9e:	5b                   	pop    %ebx
     c9f:	5d                   	pop    %ebp
     ca0:	c3                   	ret    
     ca1:	eb 0d                	jmp    cb0 <strcmp>
     ca3:	90                   	nop
     ca4:	90                   	nop
     ca5:	90                   	nop
     ca6:	90                   	nop
     ca7:	90                   	nop
     ca8:	90                   	nop
     ca9:	90                   	nop
     caa:	90                   	nop
     cab:	90                   	nop
     cac:	90                   	nop
     cad:	90                   	nop
     cae:	90                   	nop
     caf:	90                   	nop

00000cb0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	8b 4d 08             	mov    0x8(%ebp),%ecx
     cb6:	53                   	push   %ebx
     cb7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     cba:	0f b6 01             	movzbl (%ecx),%eax
     cbd:	84 c0                	test   %al,%al
     cbf:	75 14                	jne    cd5 <strcmp+0x25>
     cc1:	eb 25                	jmp    ce8 <strcmp+0x38>
     cc3:	90                   	nop
     cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    p++, q++;
     cc8:	83 c1 01             	add    $0x1,%ecx
     ccb:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     cce:	0f b6 01             	movzbl (%ecx),%eax
     cd1:	84 c0                	test   %al,%al
     cd3:	74 13                	je     ce8 <strcmp+0x38>
     cd5:	0f b6 1a             	movzbl (%edx),%ebx
     cd8:	38 d8                	cmp    %bl,%al
     cda:	74 ec                	je     cc8 <strcmp+0x18>
     cdc:	0f b6 db             	movzbl %bl,%ebx
     cdf:	0f b6 c0             	movzbl %al,%eax
     ce2:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     ce4:	5b                   	pop    %ebx
     ce5:	5d                   	pop    %ebp
     ce6:	c3                   	ret    
     ce7:	90                   	nop
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     ce8:	0f b6 1a             	movzbl (%edx),%ebx
     ceb:	31 c0                	xor    %eax,%eax
     ced:	0f b6 db             	movzbl %bl,%ebx
     cf0:	29 d8                	sub    %ebx,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     cf2:	5b                   	pop    %ebx
     cf3:	5d                   	pop    %ebp
     cf4:	c3                   	ret    
     cf5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d00 <strlen>:

uint
strlen(char *s)
{
     d00:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
     d01:	31 d2                	xor    %edx,%edx
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
     d03:	89 e5                	mov    %esp,%ebp
  int n;

  for(n = 0; s[n]; n++)
     d05:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
     d07:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     d0a:	80 39 00             	cmpb   $0x0,(%ecx)
     d0d:	74 0c                	je     d1b <strlen+0x1b>
     d0f:	90                   	nop
     d10:	83 c2 01             	add    $0x1,%edx
     d13:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     d17:	89 d0                	mov    %edx,%eax
     d19:	75 f5                	jne    d10 <strlen+0x10>
    ;
  return n;
}
     d1b:	5d                   	pop    %ebp
     d1c:	c3                   	ret    
     d1d:	8d 76 00             	lea    0x0(%esi),%esi

00000d20 <memset>:

void*
memset(void *dst, int c, uint n)
{
     d20:	55                   	push   %ebp
     d21:	89 e5                	mov    %esp,%ebp
     d23:	8b 55 08             	mov    0x8(%ebp),%edx
     d26:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     d27:	8b 4d 10             	mov    0x10(%ebp),%ecx
     d2a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d2d:	89 d7                	mov    %edx,%edi
     d2f:	fc                   	cld    
     d30:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     d32:	89 d0                	mov    %edx,%eax
     d34:	5f                   	pop    %edi
     d35:	5d                   	pop    %ebp
     d36:	c3                   	ret    
     d37:	89 f6                	mov    %esi,%esi
     d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d40 <strchr>:

char*
strchr(const char *s, char c)
{
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	8b 45 08             	mov    0x8(%ebp),%eax
     d46:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     d4a:	0f b6 10             	movzbl (%eax),%edx
     d4d:	84 d2                	test   %dl,%dl
     d4f:	75 11                	jne    d62 <strchr+0x22>
     d51:	eb 15                	jmp    d68 <strchr+0x28>
     d53:	90                   	nop
     d54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d58:	83 c0 01             	add    $0x1,%eax
     d5b:	0f b6 10             	movzbl (%eax),%edx
     d5e:	84 d2                	test   %dl,%dl
     d60:	74 06                	je     d68 <strchr+0x28>
    if(*s == c)
     d62:	38 ca                	cmp    %cl,%dl
     d64:	75 f2                	jne    d58 <strchr+0x18>
      return (char*)s;
  return 0;
}
     d66:	5d                   	pop    %ebp
     d67:	c3                   	ret    
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     d68:	31 c0                	xor    %eax,%eax
    if(*s == c)
      return (char*)s;
  return 0;
}
     d6a:	5d                   	pop    %ebp
     d6b:	90                   	nop
     d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d70:	c3                   	ret    
     d71:	eb 0d                	jmp    d80 <atoi>
     d73:	90                   	nop
     d74:	90                   	nop
     d75:	90                   	nop
     d76:	90                   	nop
     d77:	90                   	nop
     d78:	90                   	nop
     d79:	90                   	nop
     d7a:	90                   	nop
     d7b:	90                   	nop
     d7c:	90                   	nop
     d7d:	90                   	nop
     d7e:	90                   	nop
     d7f:	90                   	nop

00000d80 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     d80:	55                   	push   %ebp
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d81:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
     d83:	89 e5                	mov    %esp,%ebp
     d85:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d88:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d89:	0f b6 11             	movzbl (%ecx),%edx
     d8c:	8d 5a d0             	lea    -0x30(%edx),%ebx
     d8f:	80 fb 09             	cmp    $0x9,%bl
     d92:	77 1c                	ja     db0 <atoi+0x30>
     d94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
     d98:	0f be d2             	movsbl %dl,%edx
     d9b:	83 c1 01             	add    $0x1,%ecx
     d9e:	8d 04 80             	lea    (%eax,%eax,4),%eax
     da1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     da5:	0f b6 11             	movzbl (%ecx),%edx
     da8:	8d 5a d0             	lea    -0x30(%edx),%ebx
     dab:	80 fb 09             	cmp    $0x9,%bl
     dae:	76 e8                	jbe    d98 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
     db0:	5b                   	pop    %ebx
     db1:	5d                   	pop    %ebp
     db2:	c3                   	ret    
     db3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000dc0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	56                   	push   %esi
     dc4:	8b 45 08             	mov    0x8(%ebp),%eax
     dc7:	53                   	push   %ebx
     dc8:	8b 5d 10             	mov    0x10(%ebp),%ebx
     dcb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     dce:	85 db                	test   %ebx,%ebx
     dd0:	7e 14                	jle    de6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
     dd2:	31 d2                	xor    %edx,%edx
     dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
     dd8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     ddc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     ddf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     de2:	39 da                	cmp    %ebx,%edx
     de4:	75 f2                	jne    dd8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     de6:	5b                   	pop    %ebx
     de7:	5e                   	pop    %esi
     de8:	5d                   	pop    %ebp
     de9:	c3                   	ret    
     dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000df0 <stat>:
  return buf;
}

int
stat(char *n, struct stat *st)
{
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     df6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(char *n, struct stat *st)
{
     df9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     dfc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
     dff:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e04:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     e0b:	00 
     e0c:	89 04 24             	mov    %eax,(%esp)
     e0f:	e8 d4 00 00 00       	call   ee8 <open>
  if(fd < 0)
     e14:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e16:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
     e18:	78 19                	js     e33 <stat+0x43>
    return -1;
  r = fstat(fd, st);
     e1a:	8b 45 0c             	mov    0xc(%ebp),%eax
     e1d:	89 1c 24             	mov    %ebx,(%esp)
     e20:	89 44 24 04          	mov    %eax,0x4(%esp)
     e24:	e8 d7 00 00 00       	call   f00 <fstat>
  close(fd);
     e29:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
     e2c:	89 c6                	mov    %eax,%esi
  close(fd);
     e2e:	e8 9d 00 00 00       	call   ed0 <close>
  return r;
}
     e33:	89 f0                	mov    %esi,%eax
     e35:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     e38:	8b 75 fc             	mov    -0x4(%ebp),%esi
     e3b:	89 ec                	mov    %ebp,%esp
     e3d:	5d                   	pop    %ebp
     e3e:	c3                   	ret    
     e3f:	90                   	nop

00000e40 <gets>:
  return 0;
}

char*
gets(char *buf, int max)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
     e45:	31 f6                	xor    %esi,%esi
     e47:	53                   	push   %ebx
     e48:	83 ec 2c             	sub    $0x2c,%esp
     e4b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e4e:	eb 06                	jmp    e56 <gets+0x16>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     e50:	3c 0a                	cmp    $0xa,%al
     e52:	74 39                	je     e8d <gets+0x4d>
     e54:	89 de                	mov    %ebx,%esi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e56:	8d 5e 01             	lea    0x1(%esi),%ebx
     e59:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     e5c:	7d 31                	jge    e8f <gets+0x4f>
    cc = read(0, &c, 1);
     e5e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     e61:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e68:	00 
     e69:	89 44 24 04          	mov    %eax,0x4(%esp)
     e6d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e74:	e8 47 00 00 00       	call   ec0 <read>
    if(cc < 1)
     e79:	85 c0                	test   %eax,%eax
     e7b:	7e 12                	jle    e8f <gets+0x4f>
      break;
    buf[i++] = c;
     e7d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     e81:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
     e85:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     e89:	3c 0d                	cmp    $0xd,%al
     e8b:	75 c3                	jne    e50 <gets+0x10>
     e8d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
     e8f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     e93:	89 f8                	mov    %edi,%eax
     e95:	83 c4 2c             	add    $0x2c,%esp
     e98:	5b                   	pop    %ebx
     e99:	5e                   	pop    %esi
     e9a:	5f                   	pop    %edi
     e9b:	5d                   	pop    %ebp
     e9c:	c3                   	ret    
     e9d:	90                   	nop
     e9e:	90                   	nop
     e9f:	90                   	nop

00000ea0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     ea0:	b8 01 00 00 00       	mov    $0x1,%eax
     ea5:	cd 40                	int    $0x40
     ea7:	c3                   	ret    

00000ea8 <exit>:
SYSCALL(exit)
     ea8:	b8 02 00 00 00       	mov    $0x2,%eax
     ead:	cd 40                	int    $0x40
     eaf:	c3                   	ret    

00000eb0 <wait>:
SYSCALL(wait)
     eb0:	b8 03 00 00 00       	mov    $0x3,%eax
     eb5:	cd 40                	int    $0x40
     eb7:	c3                   	ret    

00000eb8 <pipe>:
SYSCALL(pipe)
     eb8:	b8 04 00 00 00       	mov    $0x4,%eax
     ebd:	cd 40                	int    $0x40
     ebf:	c3                   	ret    

00000ec0 <read>:
SYSCALL(read)
     ec0:	b8 05 00 00 00       	mov    $0x5,%eax
     ec5:	cd 40                	int    $0x40
     ec7:	c3                   	ret    

00000ec8 <write>:
SYSCALL(write)
     ec8:	b8 10 00 00 00       	mov    $0x10,%eax
     ecd:	cd 40                	int    $0x40
     ecf:	c3                   	ret    

00000ed0 <close>:
SYSCALL(close)
     ed0:	b8 15 00 00 00       	mov    $0x15,%eax
     ed5:	cd 40                	int    $0x40
     ed7:	c3                   	ret    

00000ed8 <kill>:
SYSCALL(kill)
     ed8:	b8 06 00 00 00       	mov    $0x6,%eax
     edd:	cd 40                	int    $0x40
     edf:	c3                   	ret    

00000ee0 <exec>:
SYSCALL(exec)
     ee0:	b8 07 00 00 00       	mov    $0x7,%eax
     ee5:	cd 40                	int    $0x40
     ee7:	c3                   	ret    

00000ee8 <open>:
SYSCALL(open)
     ee8:	b8 0f 00 00 00       	mov    $0xf,%eax
     eed:	cd 40                	int    $0x40
     eef:	c3                   	ret    

00000ef0 <mknod>:
SYSCALL(mknod)
     ef0:	b8 11 00 00 00       	mov    $0x11,%eax
     ef5:	cd 40                	int    $0x40
     ef7:	c3                   	ret    

00000ef8 <unlink>:
SYSCALL(unlink)
     ef8:	b8 12 00 00 00       	mov    $0x12,%eax
     efd:	cd 40                	int    $0x40
     eff:	c3                   	ret    

00000f00 <fstat>:
SYSCALL(fstat)
     f00:	b8 08 00 00 00       	mov    $0x8,%eax
     f05:	cd 40                	int    $0x40
     f07:	c3                   	ret    

00000f08 <link>:
SYSCALL(link)
     f08:	b8 13 00 00 00       	mov    $0x13,%eax
     f0d:	cd 40                	int    $0x40
     f0f:	c3                   	ret    

00000f10 <mkdir>:
SYSCALL(mkdir)
     f10:	b8 14 00 00 00       	mov    $0x14,%eax
     f15:	cd 40                	int    $0x40
     f17:	c3                   	ret    

00000f18 <chdir>:
SYSCALL(chdir)
     f18:	b8 09 00 00 00       	mov    $0x9,%eax
     f1d:	cd 40                	int    $0x40
     f1f:	c3                   	ret    

00000f20 <dup>:
SYSCALL(dup)
     f20:	b8 0a 00 00 00       	mov    $0xa,%eax
     f25:	cd 40                	int    $0x40
     f27:	c3                   	ret    

00000f28 <getpid>:
SYSCALL(getpid)
     f28:	b8 0b 00 00 00       	mov    $0xb,%eax
     f2d:	cd 40                	int    $0x40
     f2f:	c3                   	ret    

00000f30 <sbrk>:
SYSCALL(sbrk)
     f30:	b8 0c 00 00 00       	mov    $0xc,%eax
     f35:	cd 40                	int    $0x40
     f37:	c3                   	ret    

00000f38 <sleep>:
SYSCALL(sleep)
     f38:	b8 0d 00 00 00       	mov    $0xd,%eax
     f3d:	cd 40                	int    $0x40
     f3f:	c3                   	ret    

00000f40 <uptime>:
SYSCALL(uptime)
     f40:	b8 0e 00 00 00       	mov    $0xe,%eax
     f45:	cd 40                	int    $0x40
     f47:	c3                   	ret    

00000f48 <test>:
SYSCALL(test)
     f48:	b8 16 00 00 00       	mov    $0x16,%eax
     f4d:	cd 40                	int    $0x40
     f4f:	c3                   	ret    

00000f50 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     f50:	55                   	push   %ebp
     f51:	89 e5                	mov    %esp,%ebp
     f53:	57                   	push   %edi
     f54:	89 cf                	mov    %ecx,%edi
     f56:	56                   	push   %esi
     f57:	89 c6                	mov    %eax,%esi
     f59:	53                   	push   %ebx
     f5a:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     f5d:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f60:	85 c9                	test   %ecx,%ecx
     f62:	74 04                	je     f68 <printint+0x18>
     f64:	85 d2                	test   %edx,%edx
     f66:	78 68                	js     fd0 <printint+0x80>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     f68:	89 d0                	mov    %edx,%eax
     f6a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     f71:	31 c9                	xor    %ecx,%ecx
     f73:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     f76:	66 90                	xchg   %ax,%ax
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     f78:	31 d2                	xor    %edx,%edx
     f7a:	f7 f7                	div    %edi
     f7c:	0f b6 92 36 14 00 00 	movzbl 0x1436(%edx),%edx
     f83:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
     f86:	83 c1 01             	add    $0x1,%ecx
  }while((x /= base) != 0);
     f89:	85 c0                	test   %eax,%eax
     f8b:	75 eb                	jne    f78 <printint+0x28>
  if(neg)
     f8d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     f90:	85 c0                	test   %eax,%eax
     f92:	74 08                	je     f9c <printint+0x4c>
    buf[i++] = '-';
     f94:	c6 44 0d d7 2d       	movb   $0x2d,-0x29(%ebp,%ecx,1)
     f99:	83 c1 01             	add    $0x1,%ecx

  while(--i >= 0)
     f9c:	8d 79 ff             	lea    -0x1(%ecx),%edi
     f9f:	90                   	nop
     fa0:	0f b6 04 3b          	movzbl (%ebx,%edi,1),%eax
     fa4:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fa7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     fae:	00 
     faf:	89 34 24             	mov    %esi,(%esp)
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     fb2:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fb5:	8d 45 e7             	lea    -0x19(%ebp),%eax
     fb8:	89 44 24 04          	mov    %eax,0x4(%esp)
     fbc:	e8 07 ff ff ff       	call   ec8 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     fc1:	83 ff ff             	cmp    $0xffffffff,%edi
     fc4:	75 da                	jne    fa0 <printint+0x50>
    putc(fd, buf[i]);
}
     fc6:	83 c4 4c             	add    $0x4c,%esp
     fc9:	5b                   	pop    %ebx
     fca:	5e                   	pop    %esi
     fcb:	5f                   	pop    %edi
     fcc:	5d                   	pop    %ebp
     fcd:	c3                   	ret    
     fce:	66 90                	xchg   %ax,%ax
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     fd0:	89 d0                	mov    %edx,%eax
     fd2:	f7 d8                	neg    %eax
     fd4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
     fdb:	eb 94                	jmp    f71 <printint+0x21>
     fdd:	8d 76 00             	lea    0x0(%esi),%esi

00000fe0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     fe0:	55                   	push   %ebp
     fe1:	89 e5                	mov    %esp,%ebp
     fe3:	57                   	push   %edi
     fe4:	56                   	push   %esi
     fe5:	53                   	push   %ebx
     fe6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     fe9:	8b 45 0c             	mov    0xc(%ebp),%eax
     fec:	0f b6 10             	movzbl (%eax),%edx
     fef:	84 d2                	test   %dl,%dl
     ff1:	0f 84 c1 00 00 00    	je     10b8 <printf+0xd8>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
     ff7:	8d 4d 10             	lea    0x10(%ebp),%ecx
     ffa:	31 ff                	xor    %edi,%edi
     ffc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
     fff:	31 db                	xor    %ebx,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1001:	8d 75 e7             	lea    -0x19(%ebp),%esi
    1004:	eb 1e                	jmp    1024 <printf+0x44>
    1006:	66 90                	xchg   %ax,%ax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1008:	83 fa 25             	cmp    $0x25,%edx
    100b:	0f 85 af 00 00 00    	jne    10c0 <printf+0xe0>
    1011:	66 bf 25 00          	mov    $0x25,%di
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1015:	83 c3 01             	add    $0x1,%ebx
    1018:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
    101c:	84 d2                	test   %dl,%dl
    101e:	0f 84 94 00 00 00    	je     10b8 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
    1024:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    1026:	0f b6 d2             	movzbl %dl,%edx
    if(state == 0){
    1029:	74 dd                	je     1008 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    102b:	83 ff 25             	cmp    $0x25,%edi
    102e:	75 e5                	jne    1015 <printf+0x35>
      if(c == 'd'){
    1030:	83 fa 64             	cmp    $0x64,%edx
    1033:	0f 84 3f 01 00 00    	je     1178 <printf+0x198>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1039:	83 fa 70             	cmp    $0x70,%edx
    103c:	0f 84 a6 00 00 00    	je     10e8 <printf+0x108>
    1042:	83 fa 78             	cmp    $0x78,%edx
    1045:	0f 84 9d 00 00 00    	je     10e8 <printf+0x108>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    104b:	83 fa 73             	cmp    $0x73,%edx
    104e:	66 90                	xchg   %ax,%ax
    1050:	0f 84 ba 00 00 00    	je     1110 <printf+0x130>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1056:	83 fa 63             	cmp    $0x63,%edx
    1059:	0f 84 41 01 00 00    	je     11a0 <printf+0x1c0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    105f:	83 fa 25             	cmp    $0x25,%edx
    1062:	0f 84 00 01 00 00    	je     1168 <printf+0x188>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1068:	8b 4d 08             	mov    0x8(%ebp),%ecx
    106b:	89 55 cc             	mov    %edx,-0x34(%ebp)
    106e:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1072:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1079:	00 
    107a:	89 74 24 04          	mov    %esi,0x4(%esp)
    107e:	89 0c 24             	mov    %ecx,(%esp)
    1081:	e8 42 fe ff ff       	call   ec8 <write>
    1086:	8b 55 cc             	mov    -0x34(%ebp),%edx
    1089:	88 55 e7             	mov    %dl,-0x19(%ebp)
    108c:	8b 45 08             	mov    0x8(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    108f:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1092:	31 ff                	xor    %edi,%edi
    1094:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    109b:	00 
    109c:	89 74 24 04          	mov    %esi,0x4(%esp)
    10a0:	89 04 24             	mov    %eax,(%esp)
    10a3:	e8 20 fe ff ff       	call   ec8 <write>
    10a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    10ab:	0f b6 14 18          	movzbl (%eax,%ebx,1),%edx
    10af:	84 d2                	test   %dl,%dl
    10b1:	0f 85 6d ff ff ff    	jne    1024 <printf+0x44>
    10b7:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    10b8:	83 c4 3c             	add    $0x3c,%esp
    10bb:	5b                   	pop    %ebx
    10bc:	5e                   	pop    %esi
    10bd:	5f                   	pop    %edi
    10be:	5d                   	pop    %ebp
    10bf:	c3                   	ret    
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    10c0:	8b 45 08             	mov    0x8(%ebp),%eax
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    10c3:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    10c6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    10cd:	00 
    10ce:	89 74 24 04          	mov    %esi,0x4(%esp)
    10d2:	89 04 24             	mov    %eax,(%esp)
    10d5:	e8 ee fd ff ff       	call   ec8 <write>
    10da:	8b 45 0c             	mov    0xc(%ebp),%eax
    10dd:	e9 33 ff ff ff       	jmp    1015 <printf+0x35>
    10e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    10e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    10eb:	b9 10 00 00 00       	mov    $0x10,%ecx
        ap++;
    10f0:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    10f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    10f9:	8b 10                	mov    (%eax),%edx
    10fb:	8b 45 08             	mov    0x8(%ebp),%eax
    10fe:	e8 4d fe ff ff       	call   f50 <printint>
    1103:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
    1106:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    110a:	e9 06 ff ff ff       	jmp    1015 <printf+0x35>
    110f:	90                   	nop
      } else if(c == 's'){
        s = (char*)*ap;
    1110:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        ap++;
        if(s == 0)
    1113:	b9 2f 14 00 00       	mov    $0x142f,%ecx
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    1118:	8b 3a                	mov    (%edx),%edi
        ap++;
    111a:	83 c2 04             	add    $0x4,%edx
    111d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        if(s == 0)
    1120:	85 ff                	test   %edi,%edi
    1122:	0f 44 f9             	cmove  %ecx,%edi
          s = "(null)";
        while(*s != 0){
    1125:	0f b6 17             	movzbl (%edi),%edx
    1128:	84 d2                	test   %dl,%dl
    112a:	74 33                	je     115f <printf+0x17f>
    112c:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    112f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1132:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
          putc(fd, *s);
          s++;
    1138:	83 c7 01             	add    $0x1,%edi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    113b:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    113e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1145:	00 
    1146:	89 74 24 04          	mov    %esi,0x4(%esp)
    114a:	89 1c 24             	mov    %ebx,(%esp)
    114d:	e8 76 fd ff ff       	call   ec8 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1152:	0f b6 17             	movzbl (%edi),%edx
    1155:	84 d2                	test   %dl,%dl
    1157:	75 df                	jne    1138 <printf+0x158>
    1159:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    115c:	8b 45 0c             	mov    0xc(%ebp),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    115f:	31 ff                	xor    %edi,%edi
    1161:	e9 af fe ff ff       	jmp    1015 <printf+0x35>
    1166:	66 90                	xchg   %ax,%ax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1168:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    116c:	e9 1b ff ff ff       	jmp    108c <printf+0xac>
    1171:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1178:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    117b:	b9 0a 00 00 00       	mov    $0xa,%ecx
        ap++;
    1180:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    118a:	8b 10                	mov    (%eax),%edx
    118c:	8b 45 08             	mov    0x8(%ebp),%eax
    118f:	e8 bc fd ff ff       	call   f50 <printint>
    1194:	8b 45 0c             	mov    0xc(%ebp),%eax
        ap++;
    1197:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    119b:	e9 75 fe ff ff       	jmp    1015 <printf+0x35>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    11a0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
        putc(fd, *ap);
        ap++;
    11a3:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    11a5:	8b 4d 08             	mov    0x8(%ebp),%ecx
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    11a8:	8b 02                	mov    (%edx),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    11aa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    11b1:	00 
    11b2:	89 74 24 04          	mov    %esi,0x4(%esp)
    11b6:	89 0c 24             	mov    %ecx,(%esp)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    11b9:	88 45 e7             	mov    %al,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    11bc:	e8 07 fd ff ff       	call   ec8 <write>
    11c1:	8b 45 0c             	mov    0xc(%ebp),%eax
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
    11c4:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    11c8:	e9 48 fe ff ff       	jmp    1015 <printf+0x35>
    11cd:	90                   	nop
    11ce:	90                   	nop
    11cf:	90                   	nop

000011d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    11d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11d1:	a1 cc 14 00 00       	mov    0x14cc,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    11d6:	89 e5                	mov    %esp,%ebp
    11d8:	57                   	push   %edi
    11d9:	56                   	push   %esi
    11da:	53                   	push   %ebx
    11db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    11de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11e1:	39 c8                	cmp    %ecx,%eax
    11e3:	73 1d                	jae    1202 <free+0x32>
    11e5:	8d 76 00             	lea    0x0(%esi),%esi
    11e8:	8b 10                	mov    (%eax),%edx
    11ea:	39 d1                	cmp    %edx,%ecx
    11ec:	72 1a                	jb     1208 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11ee:	39 d0                	cmp    %edx,%eax
    11f0:	72 08                	jb     11fa <free+0x2a>
    11f2:	39 c8                	cmp    %ecx,%eax
    11f4:	72 12                	jb     1208 <free+0x38>
    11f6:	39 d1                	cmp    %edx,%ecx
    11f8:	72 0e                	jb     1208 <free+0x38>
    11fa:	89 d0                	mov    %edx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11fc:	39 c8                	cmp    %ecx,%eax
    11fe:	66 90                	xchg   %ax,%ax
    1200:	72 e6                	jb     11e8 <free+0x18>
    1202:	8b 10                	mov    (%eax),%edx
    1204:	eb e8                	jmp    11ee <free+0x1e>
    1206:	66 90                	xchg   %ax,%ax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1208:	8b 71 04             	mov    0x4(%ecx),%esi
    120b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    120e:	39 d7                	cmp    %edx,%edi
    1210:	74 19                	je     122b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1212:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1215:	8b 50 04             	mov    0x4(%eax),%edx
    1218:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    121b:	39 ce                	cmp    %ecx,%esi
    121d:	74 23                	je     1242 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    121f:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1221:	a3 cc 14 00 00       	mov    %eax,0x14cc
}
    1226:	5b                   	pop    %ebx
    1227:	5e                   	pop    %esi
    1228:	5f                   	pop    %edi
    1229:	5d                   	pop    %ebp
    122a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    122b:	03 72 04             	add    0x4(%edx),%esi
    122e:	89 71 04             	mov    %esi,0x4(%ecx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1231:	8b 10                	mov    (%eax),%edx
    1233:	8b 12                	mov    (%edx),%edx
    1235:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1238:	8b 50 04             	mov    0x4(%eax),%edx
    123b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    123e:	39 ce                	cmp    %ecx,%esi
    1240:	75 dd                	jne    121f <free+0x4f>
    p->s.size += bp->s.size;
    1242:	03 51 04             	add    0x4(%ecx),%edx
    1245:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1248:	8b 53 f8             	mov    -0x8(%ebx),%edx
    124b:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
    124d:	a3 cc 14 00 00       	mov    %eax,0x14cc
}
    1252:	5b                   	pop    %ebx
    1253:	5e                   	pop    %esi
    1254:	5f                   	pop    %edi
    1255:	5d                   	pop    %ebp
    1256:	c3                   	ret    
    1257:	89 f6                	mov    %esi,%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001260 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	57                   	push   %edi
    1264:	56                   	push   %esi
    1265:	53                   	push   %ebx
    1266:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1269:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
    126c:	8b 0d cc 14 00 00    	mov    0x14cc,%ecx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1272:	83 c3 07             	add    $0x7,%ebx
    1275:	c1 eb 03             	shr    $0x3,%ebx
    1278:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    127b:	85 c9                	test   %ecx,%ecx
    127d:	0f 84 9b 00 00 00    	je     131e <malloc+0xbe>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1283:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    1285:	8b 50 04             	mov    0x4(%eax),%edx
    1288:	39 d3                	cmp    %edx,%ebx
    128a:	76 27                	jbe    12b3 <malloc+0x53>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    128c:	8d 3c dd 00 00 00 00 	lea    0x0(,%ebx,8),%edi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1293:	be 00 80 00 00       	mov    $0x8000,%esi
    1298:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    129b:	90                   	nop
    129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    12a0:	3b 05 cc 14 00 00    	cmp    0x14cc,%eax
    12a6:	74 30                	je     12d8 <malloc+0x78>
    12a8:	89 c1                	mov    %eax,%ecx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12aa:	8b 01                	mov    (%ecx),%eax
    if(p->s.size >= nunits){
    12ac:	8b 50 04             	mov    0x4(%eax),%edx
    12af:	39 d3                	cmp    %edx,%ebx
    12b1:	77 ed                	ja     12a0 <malloc+0x40>
      if(p->s.size == nunits)
    12b3:	39 d3                	cmp    %edx,%ebx
    12b5:	74 61                	je     1318 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    12b7:	29 da                	sub    %ebx,%edx
    12b9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    12bc:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    12bf:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    12c2:	89 0d cc 14 00 00    	mov    %ecx,0x14cc
      return (void*)(p + 1);
    12c8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    12cb:	83 c4 2c             	add    $0x2c,%esp
    12ce:	5b                   	pop    %ebx
    12cf:	5e                   	pop    %esi
    12d0:	5f                   	pop    %edi
    12d1:	5d                   	pop    %ebp
    12d2:	c3                   	ret    
    12d3:	90                   	nop
    12d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    12d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12db:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
    12e1:	bf 00 10 00 00       	mov    $0x1000,%edi
    12e6:	0f 43 fb             	cmovae %ebx,%edi
    12e9:	0f 42 c6             	cmovb  %esi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    12ec:	89 04 24             	mov    %eax,(%esp)
    12ef:	e8 3c fc ff ff       	call   f30 <sbrk>
  if(p == (char*)-1)
    12f4:	83 f8 ff             	cmp    $0xffffffff,%eax
    12f7:	74 18                	je     1311 <malloc+0xb1>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    12f9:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    12fc:	83 c0 08             	add    $0x8,%eax
    12ff:	89 04 24             	mov    %eax,(%esp)
    1302:	e8 c9 fe ff ff       	call   11d0 <free>
  return freep;
    1307:	8b 0d cc 14 00 00    	mov    0x14cc,%ecx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    130d:	85 c9                	test   %ecx,%ecx
    130f:	75 99                	jne    12aa <malloc+0x4a>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1311:	31 c0                	xor    %eax,%eax
    1313:	eb b6                	jmp    12cb <malloc+0x6b>
    1315:	8d 76 00             	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1318:	8b 10                	mov    (%eax),%edx
    131a:	89 11                	mov    %edx,(%ecx)
    131c:	eb a4                	jmp    12c2 <malloc+0x62>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    131e:	c7 05 cc 14 00 00 c4 	movl   $0x14c4,0x14cc
    1325:	14 00 00 
    base.s.size = 0;
    1328:	b9 c4 14 00 00       	mov    $0x14c4,%ecx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    132d:	c7 05 c4 14 00 00 c4 	movl   $0x14c4,0x14c4
    1334:	14 00 00 
    base.s.size = 0;
    1337:	c7 05 c8 14 00 00 00 	movl   $0x0,0x14c8
    133e:	00 00 00 
    1341:	e9 3d ff ff ff       	jmp    1283 <malloc+0x23>
