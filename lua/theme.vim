colorscheme gruber-darker
colorscheme gruber-chichi
" colorscheme chihab

hi PmenuSel blend=0

fun! C_colors()
  " syntax on
  " set syntax=c
  syn match Global "\<g_[a-z0-9_]*\>"
  hi Global guifg=none
  syn keyword chiType u8 u16 u32 u64 i8 i16 i32 i64 f32 f64 _imax _umax S8 S8Array S8_v
  hi link chiType cType
  syn match cAttribute "\[\[\S*\]\]"
  hi link cAttribute Keyword
  syn match winMacro "\<[A-Z_][A-Z_0-9]*\>"
  hi link winType chiType
  hi link winMacro Macro
  syn match D3D12Struct "\<D3D[0-9]\{0,2}\S*_[A-Za-z0-9_]*\>\**\s\+"
  syn match DXGIStruct "\<DXGI_[A-Za-z0-9_]*\>"
  syn match IDType "\<\(ID3D\|IDXGI\|IWIC\|IDWrite\)[A-Za-z0-9]*\>"
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

  syn keyword myStorage thread_static force_inline global __force_inline EXTERN_C read_only
  hi link myStorage cStorageClass

  syn keyword moreBool TRUE FALSE true false success fail
  syn keyword moreConditional case default
  hi link moreBool Boolean
  hi link cond Boolean
  hi link moreConditional cConditional

  syn keyword moreKeywords sizeof typeof FT ND MU countof offsetof _Generic
  hi link moreKeywords Keyword
  syn match Operand "\(&&\|||\|>=\|>\|<\|=\|==\|->\|&\|<=\|\*\)"
	hi link cUserLabel Macro
endfun

augroup c_colors
  autocmd!
  autocmd FileType *c* call C_colors()
augroup END
