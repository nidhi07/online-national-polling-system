use ONPS; 

/* creating USERS table for login authentication */ 

create table PoliticalParty(pCode int(5),
                            pName varchar(30) NOT NULL,
							emblem blob,
							primary key(pCode));	


create table City(cityCode int(5),
                  cityName varchar(30) NOT NULL ,
				  primary key(cityCode) 
                 ) ;



create table  Voter(voterIdentityNumber int(15) auto_increment ,
                    fName varchar(25) NOT NULL,
					mName varchar(25) NOT NULL,
					lName varchar(25) NOT NULL,
					gender varchar(1) NOT NULL ,
					DOB date NOT NULL ,
                    email varchar(30) NOT NULL ,
					cityCode int(5) NOT NULL ,
					fathersName varchar(60) NOT NULL ,
					mothersName varchar(60) NOT NULL ,
					voterIdentityCard blob ,
					voterStatus boolean default false,
					primary key(voterIdentityNumber)
					);		


create table Users(userID int(10) auto_increment ,
                  voterIdentityNumber int(15),
                  password varchar(120) NOT NULL ,
				  isActive boolean  default false,
				  accountType varchar(5) NOT NULL ,
				  primary key(userID));
				  


		  
				  




create table Candidate(cID int(15),
                       voterIdentityNumber int(15) NOT NULL ,
					   pCode int(5) NOT NULL,
					   cityCode int(5) NOT NULL,
					   currentPosition varchar(30) NOT NULL,
					   votes int(5) NOT NULL,
                       candidateStatus boolean default false ,
					   primary key(cID)
                       ) ;	

create table ElectionResult(resultID int(15) auto_increment,
                            pCode int(5) NOT NULL,
                            cityCode int(5) NOT NULL,
							candidateName varchar(60) NOT NULL,
							electionYear int(5) NOT NULL,
							totalVotes int(10) NOT NULL,
							primary key(resultID)
                            );						   
				  
				  
create table CandidatePromises(promID int(15) auto_increment,
                               cID int(15) ,
                               promises TEXT NOT NULL,
                               primary key(promID));

create table QuestionAnswer(quesID int(15) auto_increment,
                            voterIdentityNumber int(15) NOT NULL ,
                            cID int(15) ,
                            question TEXT NOT NULL,
							answer  TEXT NOT NULL,
							status varchar(15),
                           primary key(quesID)
						   ) ;							   
