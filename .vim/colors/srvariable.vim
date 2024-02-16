if !has("gui_running") && &t_Co < 256
	finish
endif

if exists("syntax_on")
	syntax reset
endif

set background=dark
hi clear

function! s:h(group, style)
	let s:guiformat = "NONE"
	if has_key(a:style, "format")
		let s:guiformat = a:style.format
	endif
	execute "highlight" a:group
				\ "guifg="	(has_key(a:style, "fg") ? a:style.fg.gui : "NONE")
				\ "guibg="	(has_key(a:style, "bg") ? a:style.bg.gui : "NONE")
				\ "guisp="	(has_key(a:style, "sp") ? a:style.sp.gui : "NONE")
				\ "gui="	(!empty(s:guiformat) ? s:guiformat : "NONE")
				\ "cterm=NONE"
endfunction

let s:black		=	{	"gui": "#1f2024"	}
let s:black2	=	{	"gui": "#2f2f2f"	}
let s:blue		=	{	"gui": "#0067ff"	}
let s:blue2		=	{	"gui": "#919fcd"	}
let s:cyan		=	{	"gui": "#0099cc"	}
let s:gray		=	{	"gui": "#4d5458"	}
let s:gray2		=	{	"gui": "#617c93"	}
let s:gray3		=	{	"gui": "#707050"	}
let s:green		=	{	"gui": "#36b93b"	}
let s:green2	=	{	"gui": "#3dee3f"	}
let s:orange	=	{	"gui": "#ef7d0e"	}
let s:pink		=	{	"gui": "#d91eca"	}
let s:pink2		=	{	"gui": "#ffbbff"	}
let s:purple	=	{	"gui": "#9940ee"	}
let s:purple2	=	{	"gui": "#b450dc"	}
let s:red		=	{	"gui": "#d03636"	}
let s:yellow	=	{	"gui": "#eecc44"	}
let s:white		=	{	"gui": "#b7c8d9"	}
let s:white2	=	{	"gui": "#acacac"	}

" General
call s:h("TODO",			{	"fg": s:pink2,	"bg": s:gray	})
call s:h("Number",			{	"fg": s:pink2	})
call s:h("Comment",			{	"fg": s:gray2	})
call s:h("Statement",		{	"fg": s:red		})
call s:h("Function",		{	"fg": s:green	})

" Vim
call s:h("Normal",			{	"fg": s:white	})
call s:h("Visual",			{					"bg": s:gray3	})
call s:h("LineNr",			{	"fg": s:gray	})
call s:h("CursorLineNr",	{	"fg": s:yellow,	"bg": s:gray	})
call s:h("SpecialKey",		{	"fg": s:gray	})
call s:h("ColorColumn",		{					"bg": s:black2	})

" C
call s:h("cDefine",			{	"fg": s:blue2	})
call s:h("cInclude",		{	"fg": s:blue2	})
call s:h("cOperator",		{	"fg": s:yellow	})
call s:h("cFormat",			{	"fg": s:purple	})
call s:h("cType",			{	"fg": s:yellow	})
call s:h("cString",			{	"fg": s:green2	})
call s:h("cConstant",		{	"fg": s:pink2	})
call s:h("cStructure",		{	"fg": s:cyan	})
call s:h("cTypedef",		{	"fg": s:cyan	})
call s:h("MatchParen",		{	"fg": s:red		})
call s:h("cOctalZero",		{	"fg": s:pink	})
call s:h("cOctal",			{	"fg": s:pink2	})
