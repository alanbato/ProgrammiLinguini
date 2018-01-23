from collections import namedtuple

Token = namedtuple('Token', ['type', 'value'])

Elements = 'Number Variable Parenthesis Operator EOF'.split()

transition_mat = [
    # Space Digit Letter Hashtag Parens Operator EOF
    [0, 1, None, 3, 102, 103, 104],  # State 0
    [-1, 1, None, -1, -1, -1, -1],  # State 1: Number
    [-1, 2, 2, -1, -1, -1, -1],  # State 3: Variable
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
        raise ValueError('Char could not be read {!r}'.format(char))


def scan(input_str):
    tokens = []
    state = 0
    token_value = []

    def add_token(element_idx, value):
        new_token = Token(Elements[element_idx],
                          ''.join(value))
        tokens.append(new_token)

    for idx, char in enumerate(input_str):
        dbg = '({}, {}) -> '.format(state, char)
        if state < 100:
            prev_state = state
            state = transition_mat[prev_state][read(char)]
            if state is None:
                raise ValueError('Invalid at position {}'.format(idx))
            if state == -1:
                # Save and continue
                element_idx = prev_state - 1
                add_token(element_idx, token_value)
                token_value = [char]
                state = transition_mat[0][read(char)]
            elif state != 0:
                token_value.append(char)
        else:  # String accepted
            element_idx = state - 100
            add_token(element_idx, token_value)
            token_value = []
            state = 0
        dbg += '{}'.format(state)
        print(dbg)
    return tokens
