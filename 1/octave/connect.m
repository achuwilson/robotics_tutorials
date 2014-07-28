%  
% author: achu@achuwilson.in
% date:28:07:2014
% 
% -------------------------------------------------------------------
% THIS FILE IS DISTRIBUTED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED
% WARRANTY. THE USER WILL USE IT AT HIS/HER OWN RISK. THE ORIGINAL
% AUTHORS WILL NOT BE LIABLE FOR DATA LOSS,
% DAMAGES, LOSS OF PROFITS OR ANY OTHER KIND OF LOSS WHILE USING OR
% MISUSING THIS SOFTWARE.
% 
% You are free to use/modify/distribute this file for whatever purpose!
% -------------------------------------------------------------------
%
% 

% This function is used to connect to V-REP from Octave
%
% Make sure to have the server side running in V-REP: 
% in a child script of a V-REP scene, add following command
% to be executed just once, at simulation start:
%
% simExtRemoteApiStart(19999)
%
% then start simulation,then call this function.
#
% this function returns a clientID, which can be later used to
% interact with the simulation scene/objects in V-REP
%
% IMPORTANT: for each successful call to connect, there
% should be a corresponding call to disconnect function (disconnect.m) at the end!

function clientID = connect()
	disp('Program started');
	vrep=remApiSetup();
	simxFinish(-1); % just in case, close all opened connections
	clientID=simxStart('127.0.0.1',19999,true,true,5000,5);
	if (clientID<0)
		disp('Failed Connecting to remote API server');
	end
end
