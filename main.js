async function main() {
    const homedir = require('os').homedir();
    const fs = require('fs');
    const {execFileSync} = require('child_process');
    const tmp = require('tmp');
    const {waitFile} = require('wait-file');

    tmp.setGracefulCleanup();

    const execShFile = tmp.fileSync({
        mode: 0o744,
        prefix: 'helm-exec-',
        postfix: '.sh',
        discardDescriptor: true,
    });

    fs.mkdirSync(homedir + '/.kube', {
        recursive: true,
    });
    fs.appendFileSync(
        homedir + '/.kube/config',
        "\r\n\r\n" + process.env.INPUT_KUBECONFIG,
        {
            mode: 0o600,
        }
    );

    fs.appendFileSync(execShFile.name, process.env.INPUT_EXEC);

    await waitFile({
        resources: [
            homedir + '/.kube/config',
            execShFile.name,
        ],
    });

    try {
        const result = execFileSync(execShFile.name).toString();
        console.log(result);
        console.log('::set-output name=helm_output::' + result.split('%').join('%25').split('\n').join('%0A').split('\r').join('%0D'));
    } catch (error) {
        process.exit(1);
    }
}

main();
