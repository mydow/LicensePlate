%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% We look for string duplicates in file.
%% The file contains a number of strings,
%% each on its own row, each string is
%% a license plate number. The object is to
%% find a duplicate among the license plates.
%% When we do we terminate.
%%
%% We do not concern ourselves with which duplicte
%% or how many we find.
%%
%% cd("C:/Users/BegZ/Documents/GIT/LicensePlate/LicensePlate").
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-module(licenseplate).

-compile(export_all).

start() ->
	File = "test.txt",
	start(File).

start(File) ->
	{ok,Bin} = readFile(File),
	Res = findMatch({0,0},Bin,1),
	if
	Res == nomatch -> io:fwrite("Ingen kopia!\n");
	true -> io:fwrite("Kopia!\n")
	end.

findMatch(Result,[],_) -> Result;

findMatch(Result,Bin,Count) ->
	[HD|TL] = splitBin(Bin,<<"\r\n">>),
	[X|XS] = TL,
	Res = testMatch(HD,X),
	io:fwrite("Count: ~w~n",[Count]),
	findMatch(Res,X,Count+1).
	
readFile(File) -> file:read_file(File).

partitionBin(Binary,Start,Stop) -> binary:part(Binary,Start,Stop).

splitBin(Binary,Split) -> binary:split(Binary,Split).

testMatch(X,XS) -> binary:match(XS,X).
