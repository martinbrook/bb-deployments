local common = import 'common.libsonnet';

{
  blobstore: common.blobstore,
  httpListenAddress: ':7980',
  grpcServers: [{
    listenAddresses: [':8980'],
    authenticationPolicy: { okta: "REX says no , invalid jwt" },
//    authenticationPolicy: { allow : {} },
  }],
  schedulers: {
    'remote-execution': {
//              forwardMetadata: ["authorization","build.bazel.remote.execution.v2.requestmetadata-bin","user-agent"],
              forwardMetadata: ["authorization"],
              address: 'scheduler:8982' },
    },
  maximumMessageSizeBytes: common.maximumMessageSizeBytes,
}
