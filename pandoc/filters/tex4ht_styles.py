from pandocfilters import toJSONFilter, Header, Emph, Div, Str, Para, walk, Space

def declassify(t, c, format, meta):
    if t == 'Header':
        [level, [_id, _classes, _], children] = c
        # return Para(children)
        # raise ValueError(children[0])
        return Header(level, ["", [], _], 
            walk(children, declassify, format, meta ))
    
    if t == 'LineBreak':
        # raise ValueError(t)
        return [Space()]
    
    if t == 'Span':
        [[_id, classes, _], children] = c

        if 'cmti-12' in classes or 'cmti-10' in classes:
            if children[-1]["t"] == "Space":
                return [Emph(children[:-1]), Space()]
            return Emph(children)
        else:
            return children

    if t == 'Str':
        replacements = [
            {"l": u"\uFB01", "ch": "fi"},
            {"l": u"\uFB00", "ch": "ff"},
            {"l": u"\u201C", "ch": '"'},
            {"l": u"\u201D", "ch": '"'},
            {"l": u"\u2019", "ch": "'"},
            {"l": u"\u2018", "ch": "'"}
        ]

        for r in replacements:
            if r["l"] in c:
                return [Str(c.replace(r["l"], r["ch"]))]
    
    return None
if __name__ == "__main__":
    toJSONFilter(declassify)