local common = import 'common.libsonnet';

{
  blobstore: common.blobstore,
  httpListenAddress: ':7980',
  grpcServers: [{
    listenAddresses: [':8980'],
//    authenticationPolicy: { deny: "REX says no " },
    authenticationPolicy: { allow : {} },
  }],
  schedulers: {
    'remote-execution': {
              forwardMetadata: ["authorization","build.bazel.remote.execution.v2.requestmetadata-bin","user-agent"],

    address: 'scheduler:8982' },
  },
  maximumMessageSizeBytes: common.maximumMessageSizeBytes,
}
