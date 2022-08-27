def make_palette(name, c1, c2, c3, c4, c5, c6):
    print('% "'+ name +'" palette option')
    print(
"""\DeclareOption{""" + name + """}{
    \ColorSetup{""" + c1 + """} % #""" + c1 + """ % Title page, subtitles and hyperlink 
                {""" + c2 + """} % #""" + c2 + """ % Chapter titles 
                {""" + c3 + """} % #""" + c3 + """ % Theorems 
                {""" + c4 + """} % #""" + c4 + """ % Definitions 
                {""" + c5 + """} % #""" + c5 + """ % Remarks 
                {""" + c6 + """} % #""" + c6 + """ % Corollaries 
}"""
   )