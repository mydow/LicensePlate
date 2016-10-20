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

hello() -> io:fwrite("Hello!\n",[]).

start(File) ->
	{ok, Bin} = file:read_file(File),
	List = binary_to_list(Bin,1,6),
	List2 = binary_to_list(Bin,9,14).