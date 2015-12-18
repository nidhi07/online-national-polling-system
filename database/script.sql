use onps ;


update candidate,voter set cname = concat(fName," ",mName," ",lName) where candidate.voterIdentityNumber = voter.voterIdentityNumber ;