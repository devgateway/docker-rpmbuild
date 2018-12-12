#!/usr/bin/env groovy
// Copyright 2018, Development Gateway, see COPYING
pipeline {
  agent any

  environment {
    REPOSITORY = 'devgateway/rpmbuild'
  }

  stages {
    stage('Build & publish') {
      parallel {

        stage('Scientific 7') {
          environment {
            TAG = "$REPOSITORY:scientific-7"
          }
          steps {
            script {
              docker.withRegistry('', 'dockerhub-ssemenukha') {
                docker.build("$TAG", '-f scientific/7/Dockerfile .').push()
              }
            }
          }
        } // Scientific

      } // parallel
    } // build & publish
  } // stages

  post {
    success {
      script {
        def msg = sh(
          returnStdout: true,
          script: 'git log --oneline --format=%B -n 1 HEAD | head -n 1'
        )
        slackSend(
          message: "Built <$BUILD_URL|$JOB_NAME $BUILD_NUMBER>: $msg",
          color: "good"
        )
      }
    }
  }
}
