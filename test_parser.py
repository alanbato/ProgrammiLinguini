import HW3.scanner2 as scanner
from HW4.parser import Parser

import pytest


@pytest.fixture(scope='module')
def parser():
    return Parser()


def test_parse1(parser):
    input_str = '(+ 2 3).'
    expected = 'Valid Expression'
    tokens = scanner.scan(input_str)
    assert parser.parse(tokens) == expected


def test_parse2(parser):
    input_str = '(* 10 #myVar).'
    expected = 'Valid Expression'
    tokens = scanner.scan(input_str)
    assert parser.parse(tokens) == expected


def test_parse3(parser):
    input_str = '(* #b2 (- (+ 2 #a1) (* 12 13))).'
    expected = 'Valid Expression'
    tokens = scanner.scan(input_str)
    assert parser.parse(tokens) == expected


def test_parse4(parser):
    input_str = '(/ #x #y).'
    expected = 'Valid Expression'
    tokens = scanner.scan(input_str)
    assert parser.parse(tokens) == expected


def test_parsefail1(parser):
    input_str = '3.'
    expected = 'Syntax Error'
    tokens = scanner.scan(input_str)
    assert parser.parse(tokens) == expected


def test_parsefail2(parser):
    input_str = '3.'
    expected = 'Syntax Error'
    tokens = scanner.scan(input_str)
    assert parser.parse(tokens) == expected


def test_parsefail3(parser):
    input_str = '(+ 3 0)'
    expected = 'Syntax Error'
    tokens = scanner.scan(input_str)
    assert parser.parse(tokens) == expected


def test_parsefail4(parser):
    input_str = '(+ 2).'
    expected = 'Syntax Error'
    tokens = scanner.scan(input_str)
    assert parser.parse(tokens) == expected


def test_parsefail5(parser):
    input_str = '(* (#a 5).'
    expected = 'Syntax Error'
    tokens = scanner.scan(input_str)
    assert parser.parse(tokens) == expected
