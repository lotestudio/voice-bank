{{--
For deploy:
php vendor/bin/envoy run deploy --commit="COMMIT MESSAGE...."

test to load bash on server: source ~/.bash_profile

--}}

@setup
require __DIR__.'/vendor/autoload.php';
$setup = new App\Lote\Deploy\SetupConfiguration($branch ?? 'main');
extract($setup->all());
@endsetup

@servers(['localhost' => '127.0.0.1', 'web'=>$server])


@story('deploy')
    {{-- on localhost--}}
    local_build
    delete_build
    upload_build
    extract
    cleanup
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

    export COPYFILE_DISABLE=1
    export COPY_EXTENDED_ATTRIBUTES_DISABLE=1

    tar --no-xattrs --exclude='.*' -czf {{ $archiveName }} -C public build

    echo "Архивът {{ $archiveName }} е създаден."

    rsync -avz -e "ssh -p {{ $server_port }}" {{ $archiveName }} {{ $server_no_port }}:{{ $deploy_path }}/public/
    echo "Архивът е качен."

@endtask



@task('extract', ['on' => 'web', 'confirm'=>true])

    echo "Разархивиране..."
    cd {{ $deploy_path }}/public
    tar -xzf {{ $archiveName }}
    rm {{ $archiveName }}
    echo "Архивът е разархивиран и изтрит."

@endtask

@task('cleanup', ['on' => 'localhost','confirm'=>true])

    if [ -f {{ $archiveName }} ]; then
    rm {{ $archiveName }}
    fi

@endtask

    @task('delete_build', ['on' => 'web', 'confirm' => true])
    cd {{ $deploy_path }}
    rm -rf public/build

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
