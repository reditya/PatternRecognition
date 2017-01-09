% using qdc
[Eqdc Rqdc] = tst_p*qdc(trn_p)*testc;
% using knnc
[Eknnc Rknnc] = tst_p*knnc(trn_p)*testc;
% using ldc
[Eldc Rldc] = tst_p*ldc(trn_p)*testc;
% using parzenc
[Eparzenc Rparzenc] = tst_p*parzenc(trn_p)*testc;

