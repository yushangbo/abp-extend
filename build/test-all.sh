source "$(pwd)/common.sh"

# Build all solutions

for solutionPath in ${solutionPaths[@]};do
    solutionAbsPath="${rootFolder}/${solutionPath}"
    cd $solutionAbsPath
    dotnet test --no-build --no-restore
    if [ "$?" != 0 ] ; then
        echo "Build failed for the solution: ${solutionPath}"   
        cd $rootFolder
        exit 1
    fi
done

cd $rootFolder