<?php

namespace App\Controller;

use Cake\Core\Configure;
use Cake\Network\Exception\NotFoundException;
use Cake\View\Exception\MissingTemplateException;


class FooController extends AppController {

  public function index() {
    echo "foo";
  }
}
