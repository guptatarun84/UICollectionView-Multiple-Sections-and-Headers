# UICollectionView-Multiple-Sections-and-Headers


Define your UICollectionViewCell which will be your Header view of kind UICollectionElementKindSectionHeader - In my case I have two headers - OfferHeaderCell and APRHeaderCell defined as below:

````
        verticalCollectionView.register(UINib(nibName: "OfferHeaderCell", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "OfferHeaderCell")
        verticalCollectionView.register(UINib(nibName: "APRHeaderCell", bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "APRHeaderCell")
````        

Go ahead and return a header for each section and then set the size of the section header to have a size of zero in this UICollectionViewDelegateFlowLayout function

````
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section==0) {
            return CGSize.zero
        } else if (section==1) {
            return CGSize(width:collectionView.frame.size.width, height:133)
        } else {
            return CGSize(width:collectionView.frame.size.width, height:100)
        }

    }
````

Important to define the viewForSupplementaryElementOfKind for two different sections as below:

````
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableview = UICollectionReusableView()
        if (kind == UICollectionElementKindSectionHeader) {
            let section = indexPath.section
            switch (section) {
            case 1:
                let  firstheader: OfferHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "OfferHeaderCell", for: indexPath) as! OfferHeaderCell
                reusableview = firstheader
            case 2:
                let  secondHeader: APRHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "APRHeaderCell", for: indexPath) as! APRHeaderCell
                reusableview = secondHeader
            default:
                return reusableview
                
            }
        }
        return reusableview
    }
````

And lastly the Datasource,

````
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section==2) {
            return 2
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = verticalCollectionView.dequeueReusableCell(withReuseIdentifier: "ReviseOfferCell", for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
````
