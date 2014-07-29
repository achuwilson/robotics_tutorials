% Date 29:07:2014
% author: achu@achuwilson.in

% this function sets the position of the object
% arguments:
%     object_name:  name  of the object whose position we want to set
%     relative_object: the position of the object is set with respect to this frame
%                      to get absolute/global position, use -1 as relative_object 
%     position: the position array
%
%

function set_position(clid,object_name,relative_object,position)
    vrep=remApiSetup();
    [erc,obj_handle] = simxGetObjectHandle(clid,object_name, vrep.simx_opmode_oneshot_wait );
    if (erc==vrep.simx_return_ok)
        if(relative_object ==-1)
           erc1 = simxSetObjectPosition(clid,obj_handle,-1,position,vrep.simx_opmode_oneshot);
           %disp(position);
        else
           [erc2,rel_obj_handle] =  simxGetObjectHandle(clid,relative_object, vrep.simx_opmode_oneshot_wait );
           if (erc2==vrep.simx_return_ok)
	           erc1 = simxSetObjectPosition(clid,obj_handle,rel_obj_handle,position,vrep.simx_opmode_oneshot);
        	   %disp(position);
           else
               fprintf('Remote API function call for relative object %s returned with error code: %d\n',relative_object,erc2);
           end
        end
    else
        fprintf('Remote API function call for object %s returned with error code: %d\n',object_name,erc);
    end
end

