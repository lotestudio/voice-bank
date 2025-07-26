<?php

namespace App\Lote\Services\DevDBSync;

use Spatie\Ssh\Ssh;

class SshClients
{
    protected string $prod_host;

    protected string $staging_user;

    protected string $staging_host;

    protected string $prod_user;
    protected mixed $prod_port;
    protected mixed $stagging_port;

    public function __construct()
    {
        if (! app()->isLocal()) {
            throw new \Exception('This run only on local environment');
        }

        [$this->staging_user, $this->staging_host] = explode('@', $_ENV['DEPLOY_STAGE_SERVER']);
        [$this->prod_user, $this->prod_host] = explode('@', $_ENV['DEPLOY_PRODUCTION_SERVER']);

        $this->prod_port = $_ENV['DEPLOY_PRODUCTION_PORT'];
        $this->stagging_port = $_ENV['DEPLOY_STAGE_PORT'];

    }

    public static function getStaging(): Ssh
    {
        $client = new SshClients();

        return Ssh::create($client->staging_user, $client->staging_host, $client->stagging_port);
    }

    public static function getProduction(): Ssh
    {
        $client = new SshClients();

        return Ssh::create($client->prod_user, $client->prod_host, $client->prod_port);
    }
}
