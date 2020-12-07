using System;

namespace NetCoreDocker
{
    public class Program
    {
        static void Main(string[] args)
        {
            var contador = 0;
            var maximo = args.Length != 0 ? int.Parse(args[0]) : -1;
            while (maximo == -1 || contador < maximo)
            {
                contador++;
                Console.WriteLine($"Contando... : {contador}");
                System.Threading.Tasks.Task.Delay(1000).Wait();
            }
        }
    }
}