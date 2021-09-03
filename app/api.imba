# import state from './state'
# import html from './html-sample.txt'
import css2imba from './css2imba'
# import {compile} from './html-compiler'
# class html2imba
	# def convert arg
		# console.log arg
		# state.output = compile(arg)
# let html = new html2imba
let style = css2imba
extend tag Element
	get style
		return style
export default style