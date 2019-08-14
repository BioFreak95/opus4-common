pipeline {
    agent { dockerfile {args "-u root -v /var/run/docker.sock:/var/run/docker.sock"}}

    stages {

        stage('prepare') {
            steps {
                sh 'composer install'
                sh 'composer update'
            }
        }

        stage('test') {
            steps {
                sh 'composer check-full'
            }
        }
    }

    post {
        always {
            steps{
                step([
                    $class: 'JUnitResultArchiver',
                    testResults: 'build/logs/phpunit.xml'
                ])
                step([
                    $class: 'CloverPublisher',
                    cloverReportDir: 'build/coverage/',
                    cloverReportFileName: 'phpunit.coverage.xml"'
                ])
            }
        }
    }
}
