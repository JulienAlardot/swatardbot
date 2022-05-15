# -*- coding: utf-8 -*-
"""
Module used to test the gitHub actions
"""

from bot.core.placeholder import hello


def test_assert():
    """
    Serves only to generate at least one test
    :return:
    """
    assert hello() == "Hello World!"
