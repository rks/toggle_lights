function plan = buildfile
    import matlab.buildtool.tasks.CleanTask

    installDependencies

    plan = buildplan(localfunctions);

    plan("clean") = matlab.buildtool.tasks.CleanTask;

    plan("package") = fileexchange.tasks.PackageTask;
end

function installDependencies
    if ~any(strcmp([mpmlist().Name], "file_exchange_toolbox"))
        repo_path = getenv("MPM_REPOSITORY_PATH");

        mpmAddRepository("local", repo_path);

        mpminstall("file_exchange_toolbox", Prompt=false);
    end
end
