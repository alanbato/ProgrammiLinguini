from collections import namedtuple

Token = namedtuple('Token', ['type', 'value'])

elements = 'Number Variable Parenthesis Operator EOF'.split()

transition_mat = [
    # Space Digit Letter Hashtag Parens Operator EOF
    [0, 1, None, 3, 102, 103, 104],  # State 0
    [100, 1, None, 100, 100, 100, 100],  # State 1: Number
    [101, 2, 2, 101, 101, 101, 101],  # State 2: Variable
    [None, None, 2, None, None, None, None]  # State 3: Hashtag
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
            prev_state = state
            state = transition_mat[prev_state][read(char)]
            # print("{} {} -> {}".format(prev_state, char, state))
            if ((prev_state >= 0 and 0 < state < 4) or
                    prev_state == 0 and state >= 100):
                token_value.append(char)
                idx += 1
            if state is None:
                raise ValueError('Lexical Error at position {}'.format(idx))
            if prev_state == state == 0:
                idx += 1
        if (idx > len(input_str) and tokens[-1].type != 'EOF') or state < 100:
            raise ValueError('No EOF found')
        element_idx = state - 100
        new_token = Token(elements[element_idx],
                          ''.join(token_value))
        tokens.append(new_token)
        # print(tokens)
    return tokens


if __name__ == '__main__':
    string = input('Enter input string: ')
    print(scan(string))
