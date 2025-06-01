function Create_section(title, separator)
	title = title .. " Section"
	local padding = 80 - (2 * #separator) - 4
	local l_padding = math.floor((padding - #title) / 2)
	local r_padding = (#title % 2 == 0) and l_padding or (l_padding + 1)

	local sep_rev = separator:reverse()

	local section = separator .. " @" .. string.rep("-", padding) .. "@ " .. sep_rev .. "\n"
	section = section
		.. separator
		.. " |"
		.. string.rep(" ", l_padding)
		.. title
		.. string.rep(" ", r_padding)
		.. "| "
		.. sep_rev
		.. "\n"
	section = section .. separator .. " @" .. string.rep("-", padding) .. "@ " .. sep_rev

	return section
end
