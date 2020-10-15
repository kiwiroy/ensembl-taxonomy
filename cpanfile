# -*- mode: perl; -*-

on develop => sub {
    test_requires 'Devel::Cover::Report::Coveralls';
    test_requires 'DBD::SQLite';
    test_requires 'JSON';
    test_requires 'Proc::Daemon';
};
