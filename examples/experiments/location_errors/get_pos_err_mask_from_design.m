function [mask_u, mask_v] = get_pos_err_mask_from_design(design)
%GET_POS_ERR_MASK_FROM_DESIGN Gets mask vectors from the position_errors field
%in the given design. The masks are generated by identifying non-zero elements
%in design.position_errors.
%Input:
%   design - Array design.
%Outputs:
%   mask_u - Mask vector for the position errors along the x-axis.
%   mask_v - Mask vector for the position errors along the y-axis.

if ~isfield(design, 'position_errors') || isempty(design.position_errors)
    mask_u = false(1, design.element_count);
    mask_v = false(1, design.element_count);
    return
end

mask_u = design.position_errors(1,:) ~= 0;
if size(design.position_errors, 1) == 1
    mask_v = false(1, design.element_count);
else
    mask_v = design.position_errors(2,:) ~= 0;
end

end