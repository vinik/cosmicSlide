<?php

namespace App\Test\TestCase\Controller;

use Cake\ORM\TableRegistry;
use Cake\TestSuite\IntegrationTestCase;

class FooControllerTest extends IntegrationTestCase
{

    public function testIndex()
    {
        $this->get('/foo');

        $this->assertResponseOk();
        // More asserts.
    }


}
