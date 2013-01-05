//
//  PrincipalViewController.m
//  PickerView
//
//  Created by Rafael Brigagão Paulino on 29/08/12.
//  Copyright (c) 2012 Rafael Brigagão Paulino. All rights reserved.
//

#import "PrincipalViewController.h"

@interface PrincipalViewController ()

@end

@implementation PrincipalViewController

#pragma mark Métodos Delegate PickerView

//nomes dos elementosem cada linha
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *tituloLinha;
    
    //primeira coluna
    if(component == 0)
    {
        tituloLinha = [[_estados objectAtIndex:row] objectForKey:@"nomeEstado"];
    }
    //segunda coluna
    else
    {
        //descobrindo qual estado está marcado na coluna 0
        NSMutableDictionary *dadosEstado = [_estados objectAtIndex:[_picker selectedRowInComponent:0]];
        NSMutableArray *listaTimes = [dadosEstado objectForKey:@"listaTimes"];
        //pegar o nome de cada time
        tituloLinha = [[listaTimes objectAtIndex:row] objectForKey:@"nomeTime"];
        
    }
    
    return tituloLinha;
}

//quando alterar a selecao do elemento (coluna 0)
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //se o usuario alterou a selecao da coluna 0, precisamos aualizar a coluna  1
    if(component == 0){
        //alterou o estado selecionado
        [_picker reloadComponent:1];
        
        //seleciona o primeiro time da coluna 1
        [_picker selectRow:0 inComponent:1 animated:YES];
        
        //atualizar a imagem do escudo
        NSMutableDictionary *dadosEstado = [_estados objectAtIndex:[_picker selectedRowInComponent:0]];
        NSMutableArray *listaTimes = [dadosEstado objectForKey:@"listaTimes"];
        NSMutableDictionary *dadosTime = [listaTimes objectAtIndex:0];
        
        //nome da imagem
        NSString *nomeImagem = [dadosTime objectForKey:@"nomeImagem"];
        //criar a imagem
        UIImage *escudo = [UIImage imageNamed:nomeImagem];
        //associar ao imageVew
        _imagem.image = escudo;
    }
    //if component == 1
    else
    {
        //alterou o time selecionado
        //atualizar a imagem do escudo
        NSMutableDictionary *dadosEstado = [_estados objectAtIndex:[_picker selectedRowInComponent:0]];
        NSMutableArray *listaTimes = [dadosEstado objectForKey:@"listaTimes"];
        NSMutableDictionary *dadosTime = [listaTimes objectAtIndex:row];
        
        //nome da imagem
        NSString *nomeImagem = [dadosTime objectForKey:@"nomeImagem"];
        //criar a imagem
        UIImage *escudo = [UIImage imageNamed:nomeImagem];
        //associar ao imageVew
        _imagem.image = escudo;
    }
}


#pragma mark Métodos DataSource PickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int quantidadeLinhas;
    
    //preciso verificar qual cluna estamos montando neste momento
    //primeira coluna
    if (component == 0) {
        //coluna estados
        quantidadeLinhas = _estados.count;
    }
    //segunda coluna component == 1
    else
    {
        //coluna times
        //precisamos recuperar as informacoes do estado selecionado na primeira coluna (component 0)
        NSMutableDictionary *dicionarioEstado = [_estados objectAtIndex:[_picker selectedRowInComponent:0]];
        //guradando a informacao de quantas posicoes tem o meu vetor de times dentro do dicionario do estado
        quantidadeLinhas = [[dicionarioEstado objectForKey:@"listaTimes"] count];
        
    }
    
    //NSLog(@"linhas times %d",quantidadeLinhas);
    
    return quantidadeLinhas;
}

#pragma mark Outros Métodos da Classe
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _estados = [[NSMutableArray alloc] init];
    
    //criando um dicionario para o primeiro estado
    NSMutableDictionary *dicionarioEstado = [[NSMutableDictionary alloc] init];
    
    NSMutableArray *listaTimes = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *dadosTime = [[NSMutableDictionary alloc] init];
    //Santos
    [dadosTime setObject:@"Santos" forKey:@"nomeTime"];
    [dadosTime setObject:@"santos.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    dadosTime = [[NSMutableDictionary alloc] init];
    //Palmeiras
    [dadosTime setObject:@"Palmeiras" forKey:@"nomeTime"];
    [dadosTime setObject:@"palmeiras.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    dadosTime = [[NSMutableDictionary alloc] init];
    //Corinthans
    [dadosTime setObject:@"Corinthians" forKey:@"nomeTime"];
    [dadosTime setObject:@"corinthians.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    dadosTime = [[NSMutableDictionary alloc] init];
    //Sao Paulo
    [dadosTime setObject:@"Sao Paulo" forKey:@"nomeTime"];
    [dadosTime setObject:@"sao-paulo.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    //guardar todos os times dentro do dicionario do estado
    [dicionarioEstado setObject:@"SP" forKey:@"nomeEstado"];
    [dicionarioEstado setObject:listaTimes forKey:@"listaTimes"];
    
    //por fim, guardando os dados do estado e seus times dentro do array principal
    [_estados addObject:dicionarioEstado];
    
    //criar o RJ
    dicionarioEstado = [[NSMutableDictionary alloc] init];
    listaTimes = [[NSMutableArray alloc] init];
    dadosTime = [[NSMutableDictionary alloc] init];
    
    //Vasco
    [dadosTime setObject:@"Vasco" forKey:@"nomeTime"];
    [dadosTime setObject:@"vasco.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    dadosTime = [[NSMutableDictionary alloc] init];
    //Flamengo
    [dadosTime setObject:@"Flamengo" forKey:@"nomeTime"];
    [dadosTime setObject:@"flamengo.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    dadosTime = [[NSMutableDictionary alloc] init];
    //Botafogo
    [dadosTime setObject:@"Botafogo" forKey:@"nomeTime"];
    [dadosTime setObject:@"botafogo.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    dadosTime = [[NSMutableDictionary alloc] init];
    //Fluminense
    [dadosTime setObject:@"Fluminense" forKey:@"nomeTime"];
    [dadosTime setObject:@"fluminense.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    //guardar todos os times dentro do dicionario do estado
    [dicionarioEstado setObject:@"RJ" forKey:@"nomeEstado"];
    [dicionarioEstado setObject:listaTimes forKey:@"listaTimes"];
    
    //por fim, guardando os dados do estado e seus times dentro do array principal
    [_estados addObject:dicionarioEstado];
    
    
    //criar o RS
    dicionarioEstado = [[NSMutableDictionary alloc] init];
    listaTimes = [[NSMutableArray alloc] init];
    dadosTime = [[NSMutableDictionary alloc] init];
    
    //Inter
    [dadosTime setObject:@"Inter" forKey:@"nomeTime"];
    [dadosTime setObject:@"internacional.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    dadosTime = [[NSMutableDictionary alloc] init];
    //Flamengo
    [dadosTime setObject:@"Gremio" forKey:@"nomeTime"];
    [dadosTime setObject:@"gremio.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    //guardar todos os times dentro do dicionario do estado
    [dicionarioEstado setObject:@"RS" forKey:@"nomeEstado"];
    [dicionarioEstado setObject:listaTimes forKey:@"listaTimes"];
    
    //por fim, guardando os dados do estado e seus times dentro do array principal
    [_estados addObject:dicionarioEstado];
    
    
    //criar o PR
    dicionarioEstado = [[NSMutableDictionary alloc] init];
    listaTimes = [[NSMutableArray alloc] init];
    dadosTime = [[NSMutableDictionary alloc] init];
    
    //Inter
    [dadosTime setObject:@"Atletico" forKey:@"nomeTime"];
    [dadosTime setObject:@"atletico-pr.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    dadosTime = [[NSMutableDictionary alloc] init];
    //Flamengo
    [dadosTime setObject:@"Coritiba" forKey:@"nomeTime"];
    [dadosTime setObject:@"coritiba.png" forKey:@"nomeImagem"];
    [listaTimes addObject:dadosTime];
    
    //guardar todos os times dentro do dicionario do estado
    [dicionarioEstado setObject:@"PR" forKey:@"nomeEstado"];
    [dicionarioEstado setObject:listaTimes forKey:@"listaTimes"];
    
    
    //por fim, guardando os dados do estado e seus times dentro do array principal
    [_estados addObject:dicionarioEstado];
    
    
    NSLog(@"Estados: %@", _estados.description);
    
    //atualizando a view para mostrar o primeiro escudo ao carregar
    //atualizar a imagem do escudo
    NSMutableDictionary *dadosEstado = [_estados objectAtIndex:0];
    NSMutableArray *listaTimesC = [dadosEstado objectForKey:@"listaTimes"];
    NSMutableDictionary *dadosTimeC = [listaTimesC objectAtIndex:0];
    
    //nome da imagem
    NSString *nomeImagem = [dadosTimeC objectForKey:@"nomeImagem"];
    //criar a imagem
    UIImage *escudo = [UIImage imageNamed:nomeImagem];
    //associar ao imageVew
    _imagem.image = escudo;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
