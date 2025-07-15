<?php

function view($view)
{
    require sprintf('%s/views/%s.php', __DIR__, $view);
}

function redirect($url)
{
    http_response_code(302);
    header('Location: ' . $url);
    exit;
}

function show404()
{
    http_response_code(404);
    view('404.html');
}

function hello()
{
    view('hello.html');
}

function main()
{
    match ($_SERVER['DOCUMENT_URI']) {
        '/' => redirect('/hello'),
        '/hello' => hello(),
        default => show404(),
    };
}

main();
