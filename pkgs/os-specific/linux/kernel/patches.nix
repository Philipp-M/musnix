{ stdenv, fetchurl }:

let

  realtimePatch =
    { branch
    , kversion
    , pversion
    , url ? "https://www.kernel.org/pub/linux/kernel/projects/rt/${branch}/older/patch-${kversion}-${pversion}.patch.xz"
    , sha256
    }:
    { name  = "rt-${kversion}-${pversion}";
      patch = fetchurl {
        inherit url sha256;
      };
    };

  metadata = (import ./metadata.nix).patches;

in {
  realtimePatch_5_4  = realtimePatch metadata."5.4";
  realtimePatch_5_15 = realtimePatch metadata."5.15";
  realtimePatch_6_0  = realtimePatch metadata."6.0";
  exportRtSchedMigrate = {
    name = "export-rt-sched-migrate";
    patch = ./export-rt-sched-migrate.patch;
  };
}
