function Check-SoftLink(){ 

    [array]$softLinkAry=@()
    $constType=7
    $a=cmd /c dir /AL /S C:\
    $destDir=$null;
    for($i=0;$i -lt $a.count;$i++){
        $file=$a[$i].Split(" ")
        $temp=$a[$i].Split("[")[1]
        if($temp -ne $null){
            $temp2=$a[$i].Split("]")
            $temp3=$temp2[$temp2.count-2]
            $SourceFileName = $temp3.Split("[")[1]
            $softLinkAry+=$SourceFileName
            
            $destFileName=$null;
            if(($file.count - $SourceFileName.Split(" ").count) -eq 13)
            {
                $destFileName=$file[12]
            }elseif(($file.count - $SourceFileName.Split(" ").count) -gt 13) {
                for($j=12;$j -lt (($file.count - $SourceFileName.Split(" ").count)); $j++){
                    $destFileName=$destFileName + $file[$j]+ " "
                }    
            }
            $destFileName=$destDir+"\"+$destFileName
            $softLinkAry+=$destFileName
            $type=$file[$constType]
            $softLinkAry+=$type
          }else{
            $splitStr=$a[$i].Split(" ")
            if($splitStr[2] -eq 'ªº¥Ø¿ý'){
                #CHT
                $destDir=$splitStr[1]
                $destDir
            }elseif($splitStr[1] -eq 'Directory' ){
                #US
                $destDir=""
                $destDir=$splitStr[3]
                if($splitStr.length -gt 4){
                    for($j=4;$j -lt $splitStr.length;$j++){
                        $destDir=$destDir+" "+$splitStr[$j]
                    }
                }
            }
        }
    }
    #$softLinkAry
    return $softLinkAry
}