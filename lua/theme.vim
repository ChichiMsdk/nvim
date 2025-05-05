colorscheme gruber-darker
colorscheme gruber-chichi
" colorscheme chihab

hi PmenuSel blend=0

fun! C_colors()
  " syntax on
  " set syntax=c
  syn match Global "\<g_[a-z0-9_]*"
  hi Global guifg=none
  syn match chiType "\<[A-Z]*\(Str\)[0-9]*\>"
  hi link chiType cType
  syn match cAttribute "\[\[\S*\]\]"
  hi link cAttribute Keyword
  syn match winType "\<[A-Z]*\(BYTE\|STR\|INT\|HANDLE\|RESULT\|BOOL\|SIZE_T\|INSTANCE\)[0-9]*\>"
  syn match winType "\<[A-Z]*\(HWND\|MSG\|PARAM\|ICON\|CURSOR\|CLASSEX\|INFO\)\>"
  syn match winType "\<[A-Z]*\(VOID\|WORD\|THREAD_START_ROUTINE\)\>"
  syn match winType "\<[A-Z]*\(WIN\|HANDLE\|SYSTEM_INFO\|INTEGER\|SECURITY_ATTRIBUTES\)\>"
  syn match winMacro "\<[A-Z_]*\(GET\|IDI\|LARGE\)[A-Z_]*\>"
  hi link winType chiType
  syn keyword winMacro CALLBACK EXTERN_C FAILED SUCCEEDED __FUNCTION__ COUNTOF CHECK_R
  syn match winMacro "\<[A-Z_]*\(MAKE\|RYU\|HCHECK\)[A-Z_]*\>"
  hi link winMacro Macro
  syn match winErrorType "\<\(E\|S\)_[A-Z_]*\>"
  hi link winErrorType chiType
  syn match winDefNum "\<\(WM\|WS\|SW\|CW\|CS\|MK\|MB\|VK\|FORMAT\|HEAP\)_\S*\>"
  hi link winDef chiType
  syn match D3D12Struct "\<D3D[0-9]\{0,2}\S*_[A-Za-z0-9_]*\>\**\s\+"
  syn match DXGIStruct "\<DXGI_[A-Za-z0-9_]*\>"
  syn match IDType "\<\(ID3D\|IDXGI\|IWIC\)[A-Za-z0-9]*\>"
  hi link IDType chiType
  hi link D3D12Struct chiType
  hi link DXGIStruct chiType

  syn match IID "\<&\{0,1}IID_[A-Za-z0-9_]*\>"
  syn match CLSID "\<&\{0,1}CLSID_[A-Za-z0-9_]*\>"
  hi link IID Number
  hi link CLSID Number

  syn match glmType "\<\(mat\|vec\)[0-9]\>"
  syn keyword glmType mat4 mat3 vec4 vec3
  hi link glmType chiType

  syn match glmMacro "\<GLM_\S*\>"
  hi link glmMacro Macro

  syn keyword myStorage force_inline global __force_inline
  hi link myStorage cStorageClass

  syn keyword moreBool TRUE FALSE
  syn keyword moreConditional case default
  hi link moreBool Boolean
  hi link cond Boolean
  hi link moreConditional cConditional

  syn keyword moreKeywords sizeof typeof
  " hi link moreKeywords Keyword
  syn match Operand "\(&&\|||\|>=\|>\|<\|=\|==\|->\|&\|<=\|\*\)"
endfun

augroup c_colors
  autocmd!
  autocmd FileType *c* call C_colors()
augroup END
