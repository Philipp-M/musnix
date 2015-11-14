{ stdenv, fetchurl }:

let

  realtimePatch =
    { branch
    , kversion
    , pversion
    , url ? "https://www.kernel.org/pub/linux/kernel/projects/rt/${branch}/patch-${kversion}-${pversion}.patch.xz"
    , sha256
    }:
    { name  = "rt-${kversion}-${pversion}";
      patch = fetchurl {
        inherit url sha256;
      };
    };

in rec {

  realtimePatch_3_14 = realtimePatch
    { branch = "3.14";
      kversion = "3.14.53";
      pversion = "rt54";
      sha256 = "0msfyc0mwb62wsc5xakvxkhh3llg86n6ivkng3qhjpd6l2i2y3zn";
    };

  realtimePatch_3_18 = realtimePatch
    { branch = "3.18";
      kversion = "3.18.24";
      pversion = "rt22";
      sha256 = "039wzgh1f97h2rksa7vp2jk4nha0px2mb3760ikx309a401s0yag";
    };

  realtimePatch_4_0 = realtimePatch
    { branch = "4.0";
      kversion = "4.0.8";
      pversion = "rt6";
      sha256 = "0x3in9rjcw7lja902nj8647lhmxw3dsnav0xm2jg1irjicqk77p8";
    };

  realtimePatch_4_1 = realtimePatch
    { branch = "4.1";
      kversion = "4.1.12";
      pversion = "rt13";
      sha256 = "1dr83dx9s6iw3yg8zh91z1fism8v4z3bxzgv32caakswbyfjb043";
    };

}
