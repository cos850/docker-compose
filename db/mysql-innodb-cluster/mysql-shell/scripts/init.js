var dbPass = "1234"
var clusterName = "local-cluster"

try {
    print('Setting up InnoDB cluster...\n');
    shell.connect('root@mysql-primary:3306', dbPass)
    var cluster = dba.createCluster(clusterName);
    print('Adding instances to the cluster.');
    cluster.addInstance({user: "root", host: "mysql-secondary-1", password: dbPass})
    print('.');
    cluster.addInstance({user: "root", host: "mysql-secondary-2", password: dbPass})
    print('.\nInstances successfully added to the cluster.');
    print('\nInnoDB cluster deployed successfully.\n');
} catch(e) {
    print('\nThe InnoDB cluster could not be created.\n\nError: ' + e.message + '\n');
}