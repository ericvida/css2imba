import CSS from 'css'
import aliases from './imba-style-aliases'
# let ast = CSS.parse(sample)
# let result = CSS.stringify(ast, {sourcemap:true})
# console.log ast


class CSS2IMBA
	prop state = global: false, shorten: true
	prop prefix = if this.state.global then 'global css ' else 'css '
	# def constructor
	# 	console.log "I used [npm i css] to create an AST (Abstract Syntax Tree)"
	# 	console.log "I then traverse through the syntax tree and convert each css rule into imba syntax and store it in an array line by line"
	# 	console.log "then i join the array into a single string of imba styles"	
	def convert input
		try 
			ast = CSS.parse(input)
			stylesheet = ast.stylesheet.rules
			return traverseCSS(stylesheet).trim()
		catch
			return '...'
	def traverseCSS rules
		let res = []
		for item in rules
			res.push! "{convertRule(item).join('')}\n"
		return res.flat().join('')
		# if node.type is "stylesheet"
		# 	traverseAST(node.)
	def convertRule rule
		let res = []
		switch rule.type
			when "custom-media"
				res.push! "# {rule.type} not supported"
			when "comment"
				# res.push! "✅ " + rule.type
				res.push! "\n{iterateCommentLines(rule, '')}"
			when "charset"
				res.push! "{prefix}@charset {rule.charset}"
			when "document"
				res.push! unsupportedAtWord(rule, '').flat(3).join('')
			# when "declaration"
			# 	res.push! rule.type
			when "font-face"
				res.push! "### @font-face is not yet supported in imba\n" 
				res.push! "{prefix}{iterateRule(rule, '').flat().join('')}"
				res.push! "\n###"
			when "host"
				res.push! "# {rule.type} not supported in imba"
			when "import"
				res.push! "\n# Currently, @import is not supported in Imba"
				res.push! "\n# {prefix}{rule.type} {rule.import}"
				# res.push! unsupportedAtWord(rule, '').flat(3).join('')
			when "keyframes"
				# res.push! "✅ " + rule.type
				res.push! iterateKeyframes(rule).flat().join('')
			when "keyframe"
				res.push! "# {rule.type} not supported in imba"
			when "namespace"
				res.push! "\n# Currently, @namespace is not supported in Imba"
				res.push! "\n# {prefix}@{rule.type} {rule.namespace}"
			when "page"
				res.push! "\n{prefix}@page {iterateRule(rule, '').flat().join('')}"
			when "media"
				# res.push! "✅ " + rule.type
				res.push! "\n{prefix}{iterateAtMedia(rule).flat().join('')}"
			when "rule"
				# res.push! "✅ " + rule.type
				res.push! "\n{prefix}{iterateRule(rule, '').flat().join('')}\n"
			# when "stylesheet"
			# 	continue
			# 	# res.push! rule.type
			# when "supports"
			# 	continue
			# 	res.push! rule.type
		# console.log rule.type
		return res
	# =======================================================
	# SECTION: DOCUMENT
	# =======================================================
	def unsupportedAtWord doc, indent
		let tabs = indent
		let res = []
		res.push! iterateDocRules(doc, '')
		return res
	def iterateDocRules node, indent
		let res = []
		let tabs = indent
		let rules = node.rules
		res.push! "###\n"
		res.push! "{prefix}@document {node.document}"
		res.push! iterateRules(rules, '\t')
		res.push! "\n###"
		
		return res
	# NOTE: Returns Each Selector and Declarations of Given Rule 
	# =======================================================
	# SECTION: COMMENTS
	# =======================================================
	def iterateCommentLines comment, indent
		let res = []
		let tabs = indent
		let comm = comment.comment.split('\n')
		let commentLines = []
		for line in comm
			if line isnt ""
				commentLines.push! iterateCommentLine(line)
		if commentLines.length > 1
			res.push! "{tabs}###"
			for line in commentLines
				if line isnt ""
					res.push! "\n{tabs}{line}"
			res.push! "\n{tabs}###"
		else
			res.push! "{tabs}# {commentLines.join('')}"
		return res
	def iterateCommentLine line
		let res = []
		res.push! line.trim()
		return res.join('')
	# =======================================================
	# SECTION: KEYFRAMES
	# =======================================================
	def iterateKeyframes node
		let res = []
		let name = node.name
		let indent = ''
		res.push! "{prefix}@keyframes {name}"
		res.push! iterateKeyframeRules(node.keyframes, indent)
		# return node
		return res
	
	def iterateKeyframeRules keyframes, indent
		indent+= '\t'
		let res = []
		for keyframe in keyframes
			let name = keyframe.values.join('')
			res.push! "\n{indent}{name}"
			res.push! iterateKeyframeDeclarations(keyframe.declarations, indent)
			# res.push! keyframe
		return res
	
	def iterateKeyframeDeclarations declarations, indent
		indent+='\t'
		let res = []
		for dec,i in declarations
			let pr = dec.property
			let val = dec.value
			if state.shorten and aliases[pr]
				res.push! "\n{indent}{aliases[pr]}:{val}"
			else
				res.push! "\n{indent}{pr}:{val}"
		return res.join('')
		
	# =======================================================
	# SECTION: MEDIA
	# =======================================================
	
	def iterateAtMedia node
		let res = []
		let query = node.media
		# NOTE: CONVERTS @MEDIA MIN WIDTH
		if hasSubstring(query, "min-width")
			let min-width = query.match(/\d+/g)
			if min-width is "480"
				res.push! "@xs"
			elif min-width is "640"
				res.push! "@sm"
			elif min-width is "768"
				res.push! "@md"
			elif min-width is "1024"
				res.push! "@lg"
			elif min-width is "1280"
				res.push! "@xl"
			elif min-width is "1536"
				res.push! "@2xl"
			else
				res.push! "@{min-width}"
		# NOTE: CONVERTS @MEDIA MAX WIDTH
		elif hasSubstring(query, "max-width")
			let max-width = query.match(/\d+/g)
			if max-width is "479"
				res.push! "@lt-xs"
			elif max-width is "639"
				res.push! "@lt-sm"
			elif max-width is "767"
				res.push! "@lt-sm"
			elif min-width is "1023"
				res.push! "@lt-lg"
			elif min-width is "1279"
				res.push! "@lt-xl"
			elif min-width is "1535"
				res.push! "@lt-2xl"
			else
				res.push! "@!{max-width}"
			# res.push! "@{size}"
		elif hasSubstring(query, "orientation:landscape")
			res.push! "@landscape"
		elif hasSubstring(query, "orientation:portrait")
			res.push! "@portrait"
		elif hasSubstring(query, "prefers-color-scheme:dark")
			res.push! "@dark"
		elif hasSubstring(query, "prefers-color-scheme:light")
			res.push! "@dark"
		elif hasSubstring(query, "print")
			res.push! "@print"
		elif hasSubstring(query, "screen")
			res.push! "@screen"
		elif hasSubstring(query, "all")
			res.push! "@all"
		elif hasSubstring(query, "speech")
			res.push! "@speech"
		else
			if query.includes('(')
				res.push! "@media{query}"
			else
				res.push! "@media {query}"
		res.push! iterateAtRules(node)
		# NOTE: CONVERTS @MEDIA SUB RULES
		return res
	
	# NOTE: Returns All Media Rules
	def iterateAtRules node
		let res = []
		let rules = node.rules
		for rule in rules
			let indent = ''
			res.push! iterateAtRule(rule, indent)
		# for rule in rules
		return res
	
	# NOTE: Returns Each Selector and Declarations of Given Rule 
	def iterateAtRule rule, indent
		let res = []
		indent += '\t'
		# if rule.parent.type is "media"
		res.push! "\n{indent}{rule.selectors.join('')}"
		for declaration in iterateAtRuleDeclarations(rule.declarations, indent)
			res.push! "{declaration}"
		return res
	
	# NOTE: Returs all declarations of given Media Rul
	def iterateAtRuleDeclarations declarations, indent
		indent += '\t'
		let res = []
		for declaration in declarations
			let pr = declaration.property
			let val = declaration.value
			if state.shorten and aliases[pr]
				let keyalias = aliases[pr]
				res.push! "\n{indent}{keyalias}:{val}"
			else
				res.push! "\n{indent}{pr}:{val}"
		return res
		
	# =======================================================
	# SECTION: RULES
	# ========================================================
	def iterateRules node, indent
		let res = []
		let rules = node
		let tabs = indent
		for rule in rules
			res.push! iterateRule(rule, '\t')
		return res
	# NOTE: Returns Each Selector and Declarations of Given Rule 
	
	def iterateRule rule, indent
		let res = []
		let tabs = indent
		let newline = ''
		let selector = if rule.type is 'font-face' then '@font-face' else rule.selectors
		if rule.parent.type isnt "stylesheet"
			newline = "\n"
		res.push! "{newline}{tabs}{selector}"
		for declaration in iterateRuleDeclarations(rule.declarations, indent)
			res.push! "{declaration}"
		return res
	
	# NOTE: Returs all declarations of given Media Rul
	def iterateRuleDeclarations declarations, indent
		indent += '\t'
		let tabs = indent
		let res = []
		for declaration in declarations
			if declaration.type is "comment"
				res.push! "\n{iterateCommentLines(declaration, tabs)}"
			else
				let pr = declaration.property
				let val = declaration.value
				let alias
				if state.shorten and aliases[pr]
					alias = aliases[pr]
				else
					alias = pr
				res.push! "\n{indent}{alias}:{val}"
		return res
	def parseRule rules
		# console.log "parsing rules"
		for rule in rules
			res.push! rule
	# =======================================================
	# SECTION: UTILITIES
	# =======================================================
	# DOES: check if has substring, 
	# USED BY: by parseMedia()
	def hasSubstring string, substring
		return string.replace(' ','').indexOf(substring.replace(' ','')) > -1
		
		
		
		
		
# =======================================================
# SECTION: EXPORTS
# =======================================================		
let css2imba = new CSS2IMBA
export default css2imba
