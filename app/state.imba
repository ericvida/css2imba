let state = {}
# state.css = `.background \{ background-color:red;\}`
state.input = `.color-red \{\n\tcolor:red;\n\}`
state.output = ``
state.shortened = false
extend tag Element
	get state
		return state
export default state