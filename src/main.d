//module gs;

//import gtk.Main;
//import gtk.MainWindow;
import std.stdio, std.system, std.datetime;
import ax.application.configs, ax.data.tomlformats,  ax.data.formats,ax.multi.labels;
import axahealth.bodies;
import derelict.opengl3.gl3, derelict.sdl2.sdl;
import std.string, std.conv;
//import dlangui;
//mixin APP_ENTRY_POINT;
//import neuron.neurons;
//		"hibernated": ">=0.2.11",

/// entry point for dlangui based application
/*
extern (C) int UIAppMain(string[] args) {
    // resource directory search paths
    string[] resourceDirs = [
        appendPath(exePath, "../res/"),   // for Visual D and DUB builds
        appendPath(exePath, "../../res/") // for Mono-D builds
    ];

    // setup resource directories - will use only existing directories
    Platform.instance.resourceDirs = resourceDirs;
    // select translation file - for english language
    Platform.instance.uiLanguage = "en";
    // load theme from file "theme_default.xml"
    Platform.instance.uiTheme = "theme_default";

    // create window
    Window window = Platform.instance.createWindow("My Window", null);
    // create some widget to show in window
    //window.mainWidget = (new Button()).text("Hello world"d).margins(Rect(20,20,20,20));
    // show window
    window.show();
    // run message loop
    return Platform.instance.enterMessageLoop();
}
*/
struct Σ
{
	public:
		bool opBinary(string op)(string Ⅶ) if (op == "<<" || op == "|")
		{
			writeln(Ⅶ);
		    return true;
		}
		bool opBinaryRight(string op)(string v) if(op == ">>>"  || op == "|")
		{
		    writeln(v);
		    return true;
		}
		bool opUnary(string op)() if (op == "-")
		{
		    writeln("Ⅶ");
		    return true;
		}
}
/*
class GsGtkd : MainWindow
{
   this()
   {
      super("Getting Started with Gtkd");
      setSizeRequest(600, 400);
      move(200, 200);
      showAll();
   }
}


void main(string[] args)
{
	DerelictGL3.load();
    // Create an OpenGL context with another library (like SDL 2 or GLFW 3)
auto tmpWindow=glfwCreateWindow(1,1,"",null,null);
glfwMakeContextCurrent(tmpWindow);
    // Load versions 1.2+ and all supported ARB and EXT extensions.
    DerelictGL3.reload();
	Σ _, экран,屡娆,甾;
	Labels [2] l;
	l[0] = new Labels;
	l[1] = new Labels;
	l[0].id(1);
	l[0].text("Вес в кг");
	l[1].id(2);
	l[1].text("Рост в см");
	writeln("_ start Ł Ğ ", args[0], " ?");
	writeln("_ ");
	uint ڻڝ,ds;
	Formats forma= new TOMLFormats;
	Bodies bd= new Bodies;
	int вес;
	ushort рост1 = 0, рост2 = 0;
	if ( args.length > 1)
	{
		write(" 1 "~l[0].text()~": ");
		readf(" %s", &вес);
		write(" 2 "~l[1].text()~": ");
		readf(" %s.%s", &рост1, &рост2);
		bd.вес(1000*вес);
		bd.рост(cast(ushort) (рост1*10 + рост2));
		auto откл = bd.оценка_отклонения();
		auto midBMI = (25+18.5)/2;
		writefln(" Норма для роста %5.3f м составляет", cast(double)bd.рост()/1000);
		
		switch ( откл )
		{
			case -1:
				writefln("\t...\t%5.3f ...\t%5.3f ...\t%5.3f ...\t%5.3f ...\tкг", cast(double) bd.вес()/1000, cast(double) bd.норма_веса_min_г()/1000, cast(double)bd.ИМТ_в_граммы(midBMI)/1000 ,cast(double) bd.норма_веса_max_г()/1000);
				writefln("\t...\t%5.3f ...\t18.500 ...\t%5.3f ...\t25.000 ...", bd.индексМассыТела(), midBMI);
				write(" Недобор "); break;
			case  0:			
				if (bd.индексМассыТела() < midBMI)
				{
					writefln("\t...\t%5.3f ...\t%5.3f ...\t%5.3f ...\t%5.3f ...\tкг", cast(double) bd.норма_веса_min_г()/1000, cast(double) bd.вес()/1000, cast(double)bd.ИМТ_в_граммы(midBMI)/1000 ,cast(double) bd.норма_веса_max_г()/1000);
					writefln("\t...\t18.500 ...\t%5.3f ...\t%5.3f ...\t25.000 ...", bd.индексМассыТела(), midBMI);
				}
				else
				{
					writefln("\t...\t%5.3f ...\t%5.3f ...\t%5.3f ...\t%5.3f ...\tкг", cast(double) bd.норма_веса_min_г()/1000, cast(double)bd.ИМТ_в_граммы(midBMI)/1000, cast(double) bd.вес()/1000 ,cast(double) bd.норма_веса_max_г()/1000);
					writefln("\t...\t18.500 ...\t%5.3f ...\t%5.3f ...\t25.000 ...", midBMI, bd.индексМассыТела());
				}
				write(" Нормуль "); break;
			case  1:
				writefln("\t...\t%5.3f ...\t%5.3f ...\t%5.3f ...\t%5.3f ...\tкг", cast(double) bd.норма_веса_min_г()/1000, cast(double)bd.ИМТ_в_граммы(midBMI)/1000 ,cast(double) bd.норма_веса_max_г()/1000, cast(double) bd.вес()/1000);
				writefln("\t...\t18.500 ...\t%5.3f ...\t25.000 ...\t%5.3f ...", midBMI, bd.индексМассыТела());
				write(" Перебор "); break;
			default: write(" Ошибка  "); break;
		}	
		if (откл)
			writefln("%d кг %d г ", bd.отклонение_г()/1000, bd.отклонение_г()%1000);
		else
			writeln();
		
		//auto est bd.оценкаИМТ();
		writeln("\tОценка ИМТ ", bd.оценкаИМТ());
	}
	Configs conva;
	//tree = new TOMLFormats ;
	conva = new Configs;
	//forma = tree;
	forma.ʢ();
	conva.ʢ();
	glfwDestroyWindow(tmpWindow);
	//writeln( geT);
	//auto Ŧ = new Formats();
	//Ŧ.bar();
	//auto n = new Neurons();
	//n.bar();

//writeln(cl.get("http://kitakitsune.org"));
//write("kitakitsune.index.html", cl.get("http://kitakitsune.org"));

}*/

immutable string minimalVertexShader = `
#version 120
attribute vec2 position;
void main(void)
{
    gl_Position = vec4(position, 0, 1);
}
`;

immutable string minimalFragmentShader = `
#version 120
void main(void)
{
    gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
}
`;


void main() {
    
    DerelictSDL2.load();
    DerelictGL3.load();

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        throw new Exception("Failed to initialize SDL: " ~ to!string(SDL_GetError()));
    }

    // Set OpenGL version
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 3);

    // Set OpenGL attributes
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);

    auto sdlwindow = SDL_CreateWindow("D App",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        1024, 768, SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN);

    if (!sdlwindow)
        throw new Exception("Failed to create a SDL window: " ~ to!string(SDL_GetError()));

    SDL_GL_CreateContext(sdlwindow);
    DerelictGL3.reload();

	float[] vertices = [ -1, -1,  1, -1,  -1, 1,  1, 1];
	float[] verticesTr = [ -1, -1,  0, 1,  -1, 0,  0, 1, 0];
    ushort[] indices = [0, 1, 2, 3];
    uint vbo,vboTr, ibo;
    // Create VBO
    glGenBuffers(1, &vbo);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBufferData(GL_ARRAY_BUFFER, vertices.length * float.sizeof, vertices.ptr, GL_STATIC_DRAW);
    glBindBuffer(GL_ARRAY_BUFFER, 0);

    // Create VBO2
    glGenBuffers(1, &vboTr);
    glBindBuffer(GL_ARRAY_BUFFER, vboTr);
    glBufferData(GL_ARRAY_BUFFER, float.sizeof, verticesTr.ptr, GL_STATIC_DRAW);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    // Create IBO
    glGenBuffers(1, &ibo);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.length * float.sizeof, indices.ptr, GL_STATIC_DRAW);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

    // Program
   auto program = glCreateProgram();
    // Vertex Shader
    auto vsh = glCreateShader(GL_VERTEX_SHADER);
    auto vshSrc = minimalVertexShader.toStringz;
    glShaderSource(vsh, 1, &vshSrc, null);
    glCompileShader(vsh);
    glAttachShader(program, vsh);
    // Fragment Shader
    auto fsh = glCreateShader(GL_FRAGMENT_SHADER);
    auto fshSrc = minimalFragmentShader.toStringz;
    glShaderSource(fsh, 1, &fshSrc, null);
    glCompileShader(fsh);
    glAttachShader(program, fsh);

    glLinkProgram(program);
    glUseProgram(program);

    auto position = glGetAttribLocation(program, "position");
    auto run = true;
    auto dfs = 0.00;
    while (run) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            switch (event.type) {
                case SDL_QUIT:
                    run = false;
                    break;
                default:
                	break;
            }
        }
        dfs += 0.01;
        if (dfs > 1) dfs = 0;
       // glClearColor(dfs, 0.5, dfs, 1);
        glClearColor(1, 0.9, 0.8, 1);
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        glEnableVertexAttribArray(position);
        glBindBuffer(GL_ARRAY_BUFFER, vbo);
        
        glVertexAttribPointer(position, 3, GL_FLOAT, GL_FALSE,  0, null);
		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
        glDrawElements(GL_TRIANGLE_STRIP, 4, GL_UNSIGNED_SHORT, null);
//        glDrawArrays(GL_TRIANGLES, 0, 3);
        glDisableVertexAttribArray(position);

        SDL_GL_SwapWindow(sdlwindow);
    }
}
