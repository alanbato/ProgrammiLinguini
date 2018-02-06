class Parser():
    tokens = []

    def parseParen(self):
        token = self.tokens[0]
        if token.type == 'Parenthesis':
            self.tokens.pop(0)
        else:
            raise SyntaxError('Unparseable String')

    def parseOperator(self):
        token = self.tokens[0]
        if token.type == 'Operator':
            self.tokens.pop(0)
        else:
            raise SyntaxError('Unparseable String')

    def parseOperand(self):
        token = self.tokens[0]
        if token.type == 'Number':
            self.tokens.pop(0)
        elif token.type == 'Variable':
            self.tokens.pop(0)
        elif token.type == 'Parenthesis':
            self.parseExpr()
        else:
            raise SyntaxError('Unparseable String')

    def parseNum(self):
        token = self.tokens[0]
        if token.type == 'Number':
            self.tokens.pop(0)
        else:
            raise SyntaxError('Unparseable String')

    def parseVar(self):
        token = self.tokens[0]
        if token.type == 'Variable':
            self.tokens.pop(0)
        else:
            raise SyntaxError('Unparseable String')

    def parseEOF(self):
        token = self.tokens[0]
        if token.type == 'EOF':
            self.tokens.pop(0)
        else:
            raise SyntaxError('Unparseable String')

    def parseExpr(self):
        self.parseParen()
        self.parseOperator()
        self.parseOperand()
        self.parseOperand()
        self.parseParen()

    def parse(self, tokens):
        self.tokens = tokens
        try:
            self.parseExpr()
            self.parseEOF()
        except Exception:
            return 'Syntax Error'
        else:
            return 'Valid Expression'
