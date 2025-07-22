{{--
For deploy:
php vendor/bin/envoy run deploy --commit="COMMIT MESSAGE...."

test to load bash on server: source ~/.bash_profile

--}}

@setup
    require __DIR__.'/vendor/autoload.php';
    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
    try {
        $dotenv->load();
        $dotenv->required([
            'DEPLOY_PRODUCTION_SERVER', 'DEPLOY_PRODUCTION_PATH',
            'DEPLOY_STAGE_SERVER','DEPLOY_STAGE_PATH'
        ])->notEmpty();
    } catch ( Exception $e )  {
        echo $e->getMessage();
        exit;
    }
    $server = $_ENV['DEPLOY_STAGE_SERVER'];
    $deploy_path = $_ENV['DEPLOY_STAGE_PATH'];

    if($branch && $branch==='main'){
        $server = $_ENV['DEPLOY_PRODUCTION_SERVER'];
        $deploy_path = $_ENV['DEPLOY_PRODUCTION_PATH'];
        echo 'Proceed deploy to PRODUCTION';
    }else{
        $branch = 'staging';
        echo 'Proceed deploy to STAGING';
    }

    $composer = 'composer';
    $php = 'php';
@endsetup

@servers(['localhost' => '127.0.0.1', 'web'=>$server])


@story('deploy')
    {{-- on localhost--}}
    local_build
    delete_build
    upload_build
    git-push
    {{-- on server--}}
    init
    down
    git-pull
    @if(!$fix)
    composer
    @endif
    migrate-status
    migrate
{{--    npm-update--}}
{{--    build--}}
    clear-caches
    up
@endstory


@task('git-push', ['on' => 'localhost'])
    @if($commit)
    git add .
    git commit -m "{{ $commit }}"
    git push origin {{ $branch }}
    @else
        echo " Skipped: No commit message";
    @endif
@endtask

@task('init', ['on' => 'web'])
    cd {{$deploy_path}}
@endtask

@task('down', ['on' => 'web'])
    cd {{$deploy_path}}
    {{ $php }} artisan down
@endtask

@task('up', ['on' => 'web'])
    cd {{$deploy_path}}
    {{ $php }} artisan up
@endtask

@task('git-pull', ['on' => 'web'])
    cd {{$deploy_path}}
    git reset HEAD --hard
    git pull origin {{$branch}}
@endtask

@task('composer', ['on' => 'web'])
    cd {{$deploy_path}}
    {{ $composer }} update
    {{ $composer }} dump-autoload -o
@endtask

@task('build', ['on' => 'web', 'confirm'=>true])
cd {{$deploy_path}}
npm run build
@endtask

@task('npm-update', ['on' => 'web', 'confirm'=>true])
cd {{$deploy_path}}
npm update
@endtask


@task('migrate-status', ['on' => 'web'])
    cd {{$deploy_path}}
    {{ $php }} artisan migrate:status
@endtask

@task('migrate', ['on' => 'web', 'confirm'=>true])
    cd {{$deploy_path}}
    {{ $php }} artisan migrate --force
@endtask

@task('clear-caches', ['on' => 'web'])
    cd {{$deploy_path}}

    {{ $php }} artisan view:clear
    {{ $php }} artisan config:clear
    {{ $php }} artisan cache:clear
    {{ $php }} artisan route:clear
    {{ $php }} artisan route:trans:cache
    {{ $php }} artisan clear-compiled
    {{ $php }} artisan config:cache
    {{ $php }} artisan optimize
@endtask


@task('local_build',['on' => 'localhost','confirm'=>true])
npm run build
@endtask

@task('upload_build',['on' => 'localhost','confirm'=>true])
{{--scp -P 1022 -r public/build lote@lote.bg:~/public_html/addon_domains/omoniya.com/public/--}}


scp -P 1022 -r public/build lote@lote.bg:~/{{ $deploy_path }}/public
@endtask


@task('delete_build', ['on' => 'web','confirm'=>true])
cd {{$deploy_path}}
rm -r public/build
@endtask




@story('test')
    test-setup
    test-server
@endstory


@task('test-setup',['on' => 'localhost'])
    echo "Server: " {{$server}}
    echo "Server path: " {{$deploy_path}}
    echo "Server composer command: " {{$composer}}
    echo "commit": {{$commit}}

@endtask

@task('test-server',['on' => 'web'])
    cd {{$deploy_path}}
{{--    git status--}}
source ~/.bash_profile
echo $PATH
echo $SHELL
{{--pa--}}
{{--php -v--}}
{{--composer -V--}}
@endtask
