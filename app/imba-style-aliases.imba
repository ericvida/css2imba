const aliases =	
	'color' : 'c'
	'display' : 'd'
	'position' : 'pos'
	# padding
	'padding' : 'p'
	'padding-left' : 'pl'
	'padding-right' : 'pr'
	'padding-top' : 'pt'
	'padding-bottom' : 'pb'
	# ['pl','pr'] : 'px'
	# ['pt','pb'] : 'py'
	
	# margins
	'margin' : 'm'
	'margin-left' : 'ml'
	'margin-right' : 'mr'
	'margin-top' : 'mt'
	'margin-bottom' : 'mb'
	# ['ml','mr'] : 'mx'
	# ['mt','mb'] : 'my'
	
	# add scroll snap shorthands?
	
	'width' : 'w'
	'height' : 'h'
	'top' : 't'
	'bottom' : 'b'
	'left' : 'l'
	'right' : 'r'
	# ['width','height'] : 'size'
	
	# justify
	'justify-items' : 'ji'
	'justify-content' : 'jc'
	'justify-self' : 'js'
	# ['justify-content','justify-items'] : 'j'
	
	# align
	'align-items' : 'ai'
	'align-content' : 'ac'
	'align-self' : 'as'
	# ['align-content','align-items'] : 'a'

	# justify & align
	# ['justify-items','align-items'] : 'jai'
	# ['justify-content','align-content'] : 'jac'
	# ['justify-self','align-self'] : 'jas'
	# ['justify-content','align-content','justify-items','align-items'] : 'ja'
	
	# place
	'place-items' : '# pi'
	'place-content' : '# pc'
	'place-self' : '# ps'
	# flex
	'flex' : 'fl'
	'flex-flow' : 'flf'
	'flex-direction' : 'fld'
	'flex-basis' : 'flb'
	'flex-grow' : 'flg'
	'flex-shrink' : 'fls'
	'flex-wrap' : 'flw'
	
	# fonts
	'font-family' : 'ff'
	'font-size' : 'fs'
	'font-weight' : 'fw'
	'text-shadow' : 'ts'
	
	# text-decoration
	'text-decoration' : 'td'
	'text-decoration-line' : 'tdl'
	'text-decoration-color' : 'tdc'
	'text-decoration-style' : 'tds'
	'text-decoration-thickness' : 'tdt'
	'text-decoration-skip-ink' : 'tdsi'
	
	# text-emphasis
	'text-emphasis' : 'te'
	'text-emphasis-color' : 'tec'
	'text-emphasis-style' : 'tes'
	'text-emphasis-position' : 'tep'
	'text-emphasis-thickness' : 'tet'
		
	# text
	'text-transform' : 'tt'
	'text-align' : 'ta'
	'vertical-align' : 'va'
	'letter-spacing' : 'ls'
	'line-height' : 'lh'

	# border
	'border' : 'bd'
	'border-right' : 'bdr'
	'border-left' : 'bdl'
	'border-top' : 'bdt'
	'border-bottom' : 'bdb'

	# border-style
	'border-style' : 'bs'
	'border-right-style' : 'bsr'
	'border-left-style' : 'bsl'
	'border-top-style' : 'bst'
	'border-bottom-style' : 'bsb'

	# border-width
	'border-width' : 'bw'
	'border-right-width' : 'bwr'
	'border-left-width' : 'bwl'
	'border-top-width' : 'bwt'
	'border-bottom-width' : 'bwb'

	# border-color
	'border-color' : 'bc'
	'border-right-color' : 'bcr'
	'border-left-color' : 'bcl'
	'border-top-color' : 'bct'
	'border-bottom-color' : 'bcb'

	# border-radius
	'border-radius' : 'rd'
	'border-top-left-radius' : 'rdtl'
	'border-top-right-radius' : 'rdtr'
	'border-bottom-left-radius' : 'rdbl'
	'border-bottom-right-radius' : 'rdbr'
	# ['border-top-left-radius','border-top-right-radius'] : 'rdt'
	# ['border-bottom-left-radius','border-bottom-right-radius'] : 'rdb'
	# ['border-top-left-radius','border-bottom-left-radius'] : 'rdl'
	# ['border-top-right-radius','border-bottom-right-radius'] : 'rdr'
	
	# background
	'background' : 'bg'
	'background-position' : 'bgp'
	'background-color' : 'bgc'
	'background-repeat' : 'bgr'
	'background-image' : 'bgi'
	'background-attachment' : 'bga'
	'background-size' : 'bgs'
	'background-origin' : 'bgo'
	'background-clip' : 'bgclip'
	
	# grid
	'gap' : 'g'
	'row-gap' : 'rg'
	'column-gap' : 'cg'
	'grid-template-rows' : 'gtr'
	'grid-template-columns' : 'gtc'
	'grid-template-areas' : 'gta'
	'grid-auto-rows' : 'gar'
	'grid-auto-columns' : 'gac'
	'grid-auto-flow' : 'gaf'
	'grid-column-gap' : 'gcg'
	'grid-row-gap' : 'grg'
	'grid-area' : 'ga'
	'grid-row' : 'gr'
	'grid-column' : 'gc'
	'grid-template' : 'gt'
	'grid-row-start' : 'grs'
	'grid-column-start' : 'gcs'
	'grid-row-end' : 'gre'
	'grid-column-end' : 'gce'
	
	# shadow
	'box-shadow' : 'shadow'
	# 'box-shadow' # DEPRECATED : 'shadow'
	
	# overflow
	'overflow' : 'of'
	'overflow-x' : 'ofx'
	'overflow-y' : 'ofy'
	'overflow-anchor' : 'ofa'
	
	# content
	# 'content@before' : 'prefix'
	# 'content@after' : 'suffix'
	
	# transforms
	'x' : 'x'
	'y' : 'y'
	'z' : 'z'
	'rotate' : 'rotate'
	'scale' : 'scale'
	'scale-x' : 'scale-x'
	'scale-y' : 'scale-y'
	'skew-x' : 'skew-x'
	'skew-y' : 'skew-y'
	'transform-origin' : 'origin'
	
	# others
	'white-space' : 'ws'
	'z-index' : 'zi'
	'pointer-events' : 'pe'
	'user-select' : 'us'
	'opacity' : 'o'
	'transition' : 'tween'

export default aliases