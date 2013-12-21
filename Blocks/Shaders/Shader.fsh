//
//  Shader.fsh
//  Blocks
//
//  Created by Schell on 12/15/13.
//  Copyright (c) 2013 Zyghost. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
