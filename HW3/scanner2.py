from collections import namedtuple

Token = namedtuple('Token', ['type', 'value'])

elements = 'Number Variable Parenthesis Operator EOF'.split()

transition_mat = [
    # Space Digit Letter Hashtag Parens Operator EOF
    [0, 1, None, 3, 102, 103, 104],  # State 0
    [100, 1, None, 100, 100, 100, 100],  # State 1: Number
    [101, 2, 2, 101, 101, 101, 101],  # State 3: Variable
    [None, None, 2, None, None, None, None]  # State 2: Hashtag
]


def read(char):
    if char == ' ':
        return 0
    elif char.isdigit():
        return 1
    elif char.isalpha():
        return 2
    elif char == '#':
        return 3
    elif char in '()':
        return 4
    elif char in '+-/*':
        return 5
    elif char == '.':
        return 6
    else:
        raise ValueError('{!r} is not a valid char'.format(char))


def scan(input_str):
    tokens = []
    idx = 0
    while idx < len(input_str):
        token_value = []
        state = 0
        while idx < len(input_str) and state < 100:
            char = input_str[idx]
            state = transition_mat[state][read(char)]
            if state is None:
                raise ValueError('Lexical Error at position {}'.format(idx))
            elif state != 0:
                token_value.append(char)
            idx += 1
            print(token_value)
        if idx >= len(input_str) and (not tokens or tokens[-1].type != 'EOF'):
            raise ValueError('No EOF found')
        element_idx = state - 100
        new_token = Token(elements[element_idx],
                          ''.join(token_value))
        tokens.append(new_token)
    return tokens
