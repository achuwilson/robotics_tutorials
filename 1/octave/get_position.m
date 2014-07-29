% Date 29:07:2014
% author: achu@achuwilson.in

% this function returns the position of the object
% arguments:
%     object_name:  name  of the object whose position we want to obtain
%     relative_object: the position of the object is given with respect to this frame
%                      to get absolute/global position, use -1 as relative_object 

function position =   get_position(clid,object_name,relative_object)
    vrep=remApiSetup();
    [erc,obj_handle] = simxGetObjectHandle(clid,object_name, vrep.simx_opmode_oneshot_wait );
    if (erc==vrep.simx_return_ok)
        if(relative_object ==-1)
           [erc1,position] = simxGetObjectPosition(clid,obj_handle,-1,vrep.simx_opmode_streaming);
           %disp(position);
        else
           [erc2,rel_obj_handle] =  simxGetObjectHandle(clid,relative_object, vrep.simx_opmode_oneshot_wait );
           if (erc2==vrep.simx_return_ok)
	           [erc1,position] = simxGetObjectPosition(clid,obj_handle,rel_obj_handle,vrep.simx_opmode_streaming);
        	   %disp(position);
           else
               fprintf('Remote API function call for relative object %s returned with error code: %d\n',relative_object,erc2);
           end
        end
    else
        fprintf('Remote API function call for object %s returned with error code: %d\n',object_name,erc);
    end
end

