%> @file "@Optimizer/setDimensions.m"
%> @authors Ivo Couckuyt
%> @version 1.4 ($Revision$)
%> @date $LastChangedDate$
%> @date Copyright 2010-2013
%>
%> This file is part of the ooDACE toolbox
%> and you can redistribute it and/or modify it under the terms of the
%> GNU Affero General Public License version 3 as published by the
%> Free Software Foundation.  With the additional provision that a commercial
%> license must be purchased if the ooDACE toolbox is used, modified, or extended
%> in a commercial setting. For details see the included LICENSE.txt file.
%> When referring to the ooDACE toolbox please make reference to the corresponding
%> publications:
%>   - Blind Kriging: Implementation and performance analysis
%>     I. Couckuyt, A. Forrester, D. Gorissen, F. De Turck, T. Dhaene,
%>     Advances in Engineering Software,
%>     Vol. 49, pp. 1-13, July 2012.
%>   - Surrogate-based infill optimization applied to electromagnetic problems
%>     I. Couckuyt, F. Declercq, T. Dhaene, H. Rogier, L. Knockaert,
%>     International Journal of RF and Microwave Computer-Aided Engineering (RFMiCAE),
%>     Special Issue on Advances in Design Optimization of Microwave/RF Circuits and Systems,
%>     Vol. 20, No. 5, pp. 492-501, September 2010. 
%>
%> Contact : ivo.couckuyt@ugent.be - http://sumo.intec.ugent.be/?q=ooDACE
%> Signature
%>	this = setDimensions(this,inDim,outDim)
%
% ======================================================================
%> Includes some input checking to ensure that the bounds and the initial population are still correct.
%> If not, these variables are reset to their default values without warning!
% ======================================================================
function this = setDimensions(this,inDim,outDim)
    this.nvars = inDim;
    this.nobjectives = outDim;

    % update bounds/initpoint
    if(length(this.LB) ~= this.nvars)
        this.LB = -ones( 1, this.nvars );
    end

    if(length(this.UB) ~= this.nvars)
        this.UB = ones( 1, this.nvars );
    end

    if(size(this.initialPopulation,2) ~= this.nvars)
        if isinf( this.getPopulationSize() )
            this.initialPopulation = zeros( 100, this.nvars );
        else
            this.initialPopulation = zeros( this.getPopulationSize(), this.nvars );
        end
            
    end
end