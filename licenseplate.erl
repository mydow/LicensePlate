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
	[HD|TL] = splitBin(Bin,<<"\r\n">>),
	[X|XS] = TL,
	findMatch(HD,X).

readFile(File) -> file:read_file(File).

partitionBin(Binary,Start,Stop) -> binary:part(Binary,Start,Stop).

splitBin(Binary,Split) -> binary:split(Binary,Split).

findMatch(X,XS) -> binary:match(XS,X).
